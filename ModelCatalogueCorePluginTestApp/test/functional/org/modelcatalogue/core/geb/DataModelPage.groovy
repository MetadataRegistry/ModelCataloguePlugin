package org.modelcatalogue.core.geb

import geb.Page

class DataModelPage extends Page {

    static at = {
        title.startsWith('Activity of')
    }

    static url = '/#'

    @Override
    String convertToPath(Object[] args) {
        args ? "/${args[0]}/dataModel/${args[0]}/" : ''
    }

    static content = {
        activity {
            $("#activity-changes>div.inf-table-body>table>tbody>tr:nth-child(1)>td.inf-table-item-cell.ng-scope.col-md-7> span>span>code")
        }
        h3CeName { $('h3.ce-name', 0) }
        treeView { $('div.data-model-treeview-pane', 0).module(DataModelTreeViewModule) }
        rightSideTitleH3 { $("h3:not(.ng-hide):not(.data-model-heading)", 0) }
        dataModelButton(required: false) { $('#role_item_catalogue-element-menu-item-link', 0) }
        deleteButton(required: false) { $('#delete-menu-item-link', 0) }
        modalDialog(required: false) { $('.modal-dialog', 0).module(ModalDialogModule) }
        dropdownLink(wait: true, required: false) { $('a#role_item_catalogue-element-menu-item-link', 0) }
        dropdownMenu(required: false) {
            $('#role_item_catalogue-element-menu-item-link').siblings('ul').module(DataModelNavModule)
        }
        exportLink(required: false) { $('a#role_item_export-menu-item-link') }
        exportXMLLink(required: false) { $('a#catalogue-element-export-specific-reports_12-menu-item-link') }
        finalizedLink(required: false, wait: true) { $("a#finalize-menu-item-link") }
        rows { $('div.inf-table-body table tbody tr td') }
        policiesList { $('div.row.detail-section', 0).$('div.ng-scope span') }
        editModelButton(wait: true) { $('#role_item-detail_inline-editBtn') }
        ModelEditSaveButton(required: false, wait: true) { $('#role_item-detail_inline-edit-submitBtn') }
        finalizedStatus(required: false, wait: true) { $('div.col-md-6', text: 'Status').siblings() }
    }

    String getRowsText() {
        rows.collect { it.text() }.join(' ')
    }

    void isExportVisible() {
        !exportLink.empty
    }

    void exportXml() {
        exportXMLLink.click()
    }

    Boolean finalizedStatus() {
        finalizedStatus[0].text().toLowerCase().contains("finalized")
    }

    void export() {
        exportLink.click()
    }

    void finalizedDataModel() {
        finalizedLink.click()
    }

    void dropdown() {
        dropdownLink.click()
    }

    void delete() {
        deleteButton.click()
    }

    void dataModel() {
        dataModelButton.click()
    }

    String getDataModelTitle() {
        h3CeName.text()
    }

    String getRightSideTitle() {
        rightSideTitleH3.text()
    }

    boolean defaultChecksPolicyAdded() {
        policiesList.$('a', text: 'Default Checks').displayed
    }

    boolean UniqueOfKindPolicyAdded() {
        policiesList.$('a', text: 'Unique of Kind').displayed
    }

    void selectUniqueOfKindPolicy() {
        policiesList.$('a', text: 'Unique of Kind').click()
    }

    void editModel() {
        editModelButton.click()
    }

    void save() {
        ModelEditSaveButton.click()
        sleep(2000)
    }

    void removeUniqueOfKindPolicy() {
        $('a#remove-tag-0').click()
        sleep(2000)
    }
}
