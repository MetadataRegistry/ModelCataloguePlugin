package org.modelcatalogue.gel.export

import com.google.common.collect.ImmutableMap
import org.codehaus.groovy.grails.commons.GrailsApplication
import org.modelcatalogue.core.CatalogueElement
import org.modelcatalogue.core.DataClass
import org.modelcatalogue.core.DataClassService
import org.modelcatalogue.core.DataElement
import org.modelcatalogue.core.DataModel
import org.modelcatalogue.core.DataType
import org.modelcatalogue.core.EnumeratedType
import org.modelcatalogue.core.Relationship
import org.modelcatalogue.core.RelationshipType
import org.modelcatalogue.core.diff.CatalogueElementDiffs
import org.modelcatalogue.core.export.inventory.CatalogueElementToXlsxExporter
import org.modelcatalogue.core.export.inventory.ModelCatalogueStyles
import org.modelcatalogue.core.util.DataModelFilter

import org.modelcatalogue.spreadsheet.builder.api.RowDefinition
import org.modelcatalogue.spreadsheet.builder.api.SheetDefinition
import org.modelcatalogue.spreadsheet.builder.api.SpreadsheetBuilder
import org.modelcatalogue.spreadsheet.builder.poi.PoiSpreadsheetBuilder

import static org.modelcatalogue.core.export.inventory.ModelCatalogueStyles.H1
import static org.modelcatalogue.core.export.inventory.ModelCatalogueStyles.CHANGE_NEW
import static org.modelcatalogue.core.export.inventory.ModelCatalogueStyles.CHANGE_REMOVAL


/**
 * GridReportXlsxExporter.groovy
 * Purpose: Generate an excel report from a data model, including metadata using the required format
 *
 * @author Adam Milward
 * @version 31/03/2017
 */
class GridReportXlsxExporter  {

    final CatalogueElement element
    final DataClassService dataClassService
    final GrailsApplication grailsApplication
    final int depth

    static GridReportXlsxExporter create(DataModel element, DataClassService dataClassService, GrailsApplication grailsApplication, Integer depth = 3) {
        return new GridReportXlsxExporter(element, dataClassService, grailsApplication,  depth)
    }


    private GridReportXlsxExporter(CatalogueElement element, DataClassService dataClassService, GrailsApplication grailsApplication, Integer depth = 3){
        this.element = element
        this.dataClassService = dataClassService
        this.grailsApplication = grailsApplication
        this.depth = depth
    }

    void export(OutputStream outputStream) {
        SpreadsheetBuilder builder = new PoiSpreadsheetBuilder()
        List<DataClass> dataClasses = Collections.emptyList()
        dataClasses = dataClassService.getTopLevelDataClasses(DataModelFilter.includes(element as DataModel), ImmutableMap.of('status', 'active'), true).items

        builder.build(outputStream) {
            apply ModelCatalogueStyles
            sheet("$element.name $element.dataModelSemanticVersion" ) { SheetDefinition sheetDefinition ->
                row {
                    cell {
                        value 'Class Hierarchy'
                        colspan depth
                        style H1
                    }
                    cell {
                        value 'Data Element'
//                        colspan 2
                        width auto
                        style H1
                    }
//                    cell {
//                        value 'Data type'
//                        width auto
//                    }
//                    cell {
//                        value 'Validation Rule'
//                        width auto
//                    }
                    cell {
                        value 'Matched'
                        width auto
                        style H1
                    }
                    cell {
                        value '% Match'
                        width auto
                        style H1
                    }
                    cell {
                        value 'Matched Name'
                        width auto
                        style H1
                    }
                    cell {
                        value 'Matched On'
                        width auto
                        style H1
                    }
//                    cell {
//                        value 'Match Type'
//                        width auto
//                    }
//                    cell {
//                        value 'Match Rule'
//                        width auto
//                    }

                }

                dataClasses.each{ dataClass->
                    buildRows(sheetDefinition, dataClass.getOutgoingRelationshipsByType(RelationshipType.hierarchyType), 1, 2)
                }

            }
        }

    }

    /**
     * Renders rows for each data class passed in children collection.
     * @param sheet the current sheet
     * @param children data classes to be rendered
     * @param currentDepth the current depth starting with one
     */
    private Integer buildRows(SheetDefinition sheet, Collection<Relationship> children, int columnDepth, int rowDepth) {
        if (columnDepth > depth) {
            return rowDepth
        }
        children.each { Relationship relationship ->
            CatalogueElement child = relationship.destination
            rowDepth = printClass(child, sheet, columnDepth, rowDepth, children.size())
        }
        rowDepth
    }


    private Integer printClass(DataClass child, SheetDefinition sheet, int columnDepth, int rowDepth, int childrenSize) {

        Collection<Relationship> dataElements = child.getOutgoingRelationshipsByType(RelationshipType.containmentType)
        sheet.with { SheetDefinition sheetDefinition ->
            row(rowDepth) { RowDefinition rowDefinition ->
                cell(columnDepth) {
                    value child.name
                    link to url "${child.defaultModelCatalogueId.split("/catalogue")[0] + "/load?" + child.defaultModelCatalogueId}"
                }
                if (dataElements) {
                    printDataElement(rowDefinition, dataElements.head())
                }
            }
            if (dataElements.size() > 1) {
                for (Relationship dataElementRelationship in dataElements.tail()) {
                    rowDepth++
                    row(rowDepth) { RowDefinition rowDefinition ->
                        printDataElement(rowDefinition, dataElementRelationship)
                    }
                }
            }
            rowDepth = buildRows(sheetDefinition, child.getOutgoingRelationshipsByType(RelationshipType.hierarchyType), columnDepth + 1, (childrenSize > 1 || dataElements.size() > 1) ? (rowDepth + 1) : rowDepth)
            rowDepth
        }
    }

    void printDataElement(RowDefinition rowDefinition, Relationship dataElementRelationship) {
        DataElement dataElement = dataElementRelationship.destination
        Collection<Relationship> relatedTo = dataElement.getRelationshipsByType(RelationshipType.synonymType)
        rowDefinition.with {
            cell(depth + 1) {
                value dataElement.name
                link to url "${dataElement.defaultModelCatalogueId.split("/catalogue")[0] + "/load?" + dataElement.defaultModelCatalogueId}"
            }
//            cell {
//                value "${dataElementRelationship.ext[Metadata.MIN_OCCURS] ?: '0'}..${dataElementRelationship.ext[Metadata.MAX_OCCURS] ?: '*'}"
//            }
//            cell {
//                value "${(dataElement?.dataType) ? printDataType(dataElement?.dataType) : ""}"
//                style {
//                    wrap text
//                }
//            }
//            cell {
//                value "${(dataElement?.dataType.rule) ? dataElement?.dataType.rule : ""}"
//                style {
//                    wrap text
//                }
//            }
            if(relatedTo){
                cell{
                    value "MATCHED"
                }
                printMatches(rowDefinition, relatedTo.head())
            }else{
                cell{
                    value "NO MATCH"
                }
            }


        }
    }

    void printMatches(RowDefinition rowDefinition, Relationship dataElementRelationship) {
        DataElement dataElement = dataElementRelationship.destination
        rowDefinition.with {
            cell(depth + 3) {
                value "${dataElementRelationship.ext.get("match") ?: 'NA'}"
            }
            cell {
                value "$dataElement.name ($dataElement.dataModel.name)"
                link to url "${dataElement.defaultModelCatalogueId.split("/catalogue")[0] + "/load?" + dataElement.defaultModelCatalogueId}"
            }
            cell {
                value "${dataElementRelationship.ext.get("matched_on") ?: 'MANUAL'}"
            }

//            cell {
//                value "${(dataElement?.dataType) ? printDataType(dataElement?.dataType) : ""}"
//                style {
//                    wrap text
//                }
//            }
//            cell {
//                value "${(dataElement?.dataType.rule) ? dataElement?.dataType.rule : ""}"
//                style {
//                    wrap text
//                }
//            }
        }
    }



    String printDataType(DataType dataType){

        if(dataType.instanceOf(EnumeratedType)){
            return dataType.prettyPrint()
        }

        return dataType.name

    }

}