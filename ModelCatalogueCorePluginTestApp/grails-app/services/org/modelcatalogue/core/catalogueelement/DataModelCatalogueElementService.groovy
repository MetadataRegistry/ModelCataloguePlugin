package org.modelcatalogue.core.catalogueelement

import grails.util.GrailsNameUtils
import groovy.transform.CompileStatic
import org.modelcatalogue.core.CatalogueElement
import org.modelcatalogue.core.DataModel

@CompileStatic
class DataModelCatalogueElementService extends AbstractCatalogueElementService {

    @Override
    CatalogueElement findById(Long id) {
        dataModelGormService.findById(id)
    }

    @Override
    protected String resourceName() {
        GrailsNameUtils.getPropertyName(DataModel.class.name)
    }
}
