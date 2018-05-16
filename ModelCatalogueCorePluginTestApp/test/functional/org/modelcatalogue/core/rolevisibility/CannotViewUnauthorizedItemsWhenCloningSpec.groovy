package org.modelcatalogue.core.rolevisibility

import geb.spock.GebSpec
import spock.lang.Issue
import spock.lang.Narrative
import spock.lang.Specification
import spock.lang.Title
import spock.lang.Stepwise
import spock.lang.Shared
import org.modelcatalogue.core.geb.*

@Issue('https://metadata.atlassian.net/browse/MET-2023')
@Title('Check that while cloning a data class, user is not able to view unauthorized data class')
@Narrative($/
 - 1. Login to Metadata Exchange as supervisor | Login successful
 - 2. Select 'Create Data Model' button (black plus sign) in the right hand top menu to create a data model | Redirected to 'Create Data Model' page
 - 3. Populate Data Model Name Catalogue ID, Description and click save | Data model is created. Redirected to Data Model page
 - 4. In data model, navigate to Data Classes and click the green plus button to create new Data Class | Data Class pop-up Wizard appears
 - 5. Populate Data Class Wizard form with Data Class Name, Catalogue ID and Description. Press Save (green tick at top-right), wait until the data class has been created then click Close | Data Class is created and listed under Draft Data Classes
 - 6. Select Model Catalogue link at top-left of page | Directed to main Dashboard page
 - 7. Repeat steps 2-5 | Second new data model containing a new data class is created
 - 8. From Data Model menu drop-down, select option to 'Finalize' model and fill in 'Finalize Data Model' pop-up with Semantic Version number and revision notes. Click on 'Finalize' button. | 'Finalizing' process dialogue box appears
 - 9. Wait until text in messages panel ends with 'COMPLETED SUCCESSFULLY'. Click 'Hide' on the 'Finalizing' process box | Data Model is finalized. Redirected to main page of Finalized data model in both display and tree navigation panel
 - 10. Repeat steps 6-9 | Third new finalized data model containing a new data class is created
 - 11. Navigate and click on Settings menu button ( top right hand side) and from drop-down menu, select Data Model ACL | Redirected to Data Model ACL page - Data Model Permissions is title
 - 12. Select the first data model that you created . | Go to data model permissions page. Data Model name is the title .
 - 13. Select curator from drop down list and from second drop down list give them administration rights over this data model | Curator appears in list of users with access to data model
 - 14. Repeat steps 9-11 for the second data model created | The curator is given administration rights for the second data model
 - 15. Do nothing in regards to permissions for the third model. | By doing nothing, assurance is given that Curator is not authorised to view the third data model.
 - 16. Log out as supervisor | Supervisor is logged out
 - 17. Log in as curator | Curator is logged in
 - 18. Select first data model created from list | Directed to Data Model page
 - 19. On the tree view, select Data Classes to go to Data Classes page. | Check that right side title is Active Data Classes. Page displays list of Data Classes within Data Model.
 - 20. Click on the green button 'Create New Class' at the bottom of the list | Data Class Wizard Pop up appears. Check that title is Data Class Wizard.
 - 21. In the Name Section of the form field, click on the 'Clone' Icon button to the right hand side of the Name form field. | Clone Data Class pop-up dialogue box appears
 - 22. Click on Data Class icon to the left of the search bar form field within the 'Clone Data Class' pop - up box. | 'Search ' bar pop-up dialogue box appears with list of Data Classes within the Data Model that you can clone.
 - 23. In Search bar ( Search for Data Class) try typing in the name of the Data Class of the third model created by the Supervisor | Verify that name does not appear.
 - 24. Click on the 'Add Import' link beneath the search bar form field | 'Add Data Model Import' pop-up dialogue box appears.
 - 25. Click on the 'Data Model' book icon to the left of the 'Add Data Model Inputs' search bar form field to bring up list of possible data models to import. | List of data models that you can import appears.
 - 26. Verify that the third data model created by Supervisor is not present in this list. | Third data model is not present.
 - 27. Click the close button to close the Add Data Model Import List box. | 'Add Data Model' Import list box is closed.
 - 28. Click the OK button to close the Add Data Model Import pop-up box | 'Add Data Model' Imports pop-up is closed
 - 29. Click the close button to close the Data Class Search pop-up box | 'Data Class Search' pop-up is closed
 - 30. Click the Cancel button to close the Clone Data Class pop-up box | 'Clone Data Class' pop-up is closed
 - 31. Click the Close button to close the Data Class Wizard pop-up box and click OK when the Close Data Class Wizard pop-up appears | 'Data Class Wizard' pop-up is closed
/$)

@Stepwise
class CannotViewUnauthorizedItemsWhenCloningSpec extends GebSpec {

    def "login as supervisor"() {
        when:
        LoginPage loginPage = to LoginPage
        loginPage.login('supervisor', 'supervisor')
        then:
        at DashboardPage
    }

    def "create first data model and data class"() {
        when:
        DashboardPage dashboardPage = browser.page DashboardPage
        dashboardPage.nav.createDataModel()
        then:
        at CreateDataModelPage

        when:
        CreateDataModelPage createDataModelPage = browser.page CreateDataModelPage
        createDataModelPage.name = "FIRST_TESTING_MODEL"
        createDataModelPage.description = "new description"
        createDataModelPage.submit()
        then:
        at DataModelPage

        when:
        DataModelPage dataModelPage = browser.page DataModelPage
        dataModelPage.treeView.dataClasses()
        then:
        at DataClassesPage

        when:
        DataClassesPage dataClassesPage = browser.page DataClassesPage
        dataClassesPage.createDataClass()
        then:
        at CreateDataClassPage

        when:
        CreateDataClassPage createDataClassPage = browser.page CreateDataClassPage
        createDataClassPage.name = "FIRST_TESTING_CLASS"
        createDataClassPage.modelCatalogueId = "${UUID.randomUUID()}"
        createDataClassPage.description = 'THIS IS MY DATA CLASS'
        createDataClassPage.finish()
        createDataClassPage.exit()
        then:
        at DataClassesPage
    }

    def "create second data model and data class"() {
        when:
        DashboardPage dashboardPage = to DashboardPage
        dashboardPage.nav.createDataModel()
        then:
        at CreateDataModelPage

        when:
        CreateDataModelPage createDataModelPage = browser.page CreateDataModelPage
        createDataModelPage.name = "SECOND_TESTING_MODEL"
        createDataModelPage.description = "new description"
        createDataModelPage.submit()
        then:
        at DataModelPage

        when:
        DataModelPage dataModelPage = browser.page DataModelPage
        dataModelPage.treeView.dataClasses()
        then:
        at DataClassesPage

        when:
        DataClassesPage dataClassesPage = browser.page DataClassesPage
        dataClassesPage.createDataClass()
        then:
        at CreateDataClassPage

        when:
        CreateDataClassPage createDataClassPage = browser.page CreateDataClassPage
        createDataClassPage.name = "SECOND_TESTING_CLASS"
        createDataClassPage.modelCatalogueId = "${UUID.randomUUID()}"
        createDataClassPage.description = 'THIS IS MY DATA CLASS'
        createDataClassPage.finish()
        createDataClassPage.exit()
        then:
        at DataClassesPage
    }

    def "finalize second data model"() {
        when:
        DataClassesPage dataClassesPage = browser.page DataClassesPage
        dataClassesPage.treeView.dataModel()
        then:
        at DataModelPage

        when:
        DataModelPage dataModelPage = browser.page DataModelPage
        dataModelPage.dropdown()
        dataModelPage.finalizedDataModel()
        then:
        at FinalizeDataModelPage

        when:
        FinalizeDataModelPage finalizeDataModelPage = browser.page FinalizeDataModelPage
        finalizeDataModelPage.versionNote = "data model is finalized"
        finalizeDataModelPage.submit()
        then:
        at FinalizedDataModelPage

        when:
        FinalizedDataModelPage finalizedDataModelPage = browser.page FinalizedDataModelPage
        finalizedDataModelPage.hideConfirmation()
        then:
        at DataModelPage
    }

    def "create third data model and data class"() {
        when:
        DashboardPage dashboardPage = to DashboardPage
        dashboardPage.nav.createDataModel()
        then:
        at CreateDataModelPage

        when:
        CreateDataModelPage createDataModelPage = browser.page CreateDataModelPage
        createDataModelPage.name = "THIRD_TESTING_MODEL"
        createDataModelPage.description = "new description"
        createDataModelPage.submit()
        then:
        at DataModelPage

        when:
        DataModelPage dataModelPage = browser.page DataModelPage
        dataModelPage.treeView.dataClasses()
        then:
        at DataClassesPage

        when:
        DataClassesPage dataClassesPage = browser.page DataClassesPage
        dataClassesPage.createDataClass()
        then:
        at CreateDataClassPage

        when:
        CreateDataClassPage createDataClassPage = browser.page CreateDataClassPage
        createDataClassPage.name = "THIRD_TESTING_CLASS"
        createDataClassPage.modelCatalogueId = "${UUID.randomUUID()}"
        createDataClassPage.description = 'THIS IS MY DATA CLASS'
        createDataClassPage.finish()
        createDataClassPage.exit()
        then:
        at DataClassesPage
    }

    def "finalize third data model"() {
        when:
        DataClassesPage dataClassesPage = browser.page DataClassesPage
        dataClassesPage.treeView.dataModel()
        then:
        at DataModelPage

        when:
        DataModelPage dataModelPage = browser.page DataModelPage
        dataModelPage.dropdown()
        dataModelPage.finalizedDataModel()
        then:
        at FinalizeDataModelPage

        when:
        FinalizeDataModelPage finalizeDataModelPage = browser.page FinalizeDataModelPage
        finalizeDataModelPage.versionNote = "data model is finalized"
        finalizeDataModelPage.submit()
        then:
        at FinalizedDataModelPage

        when:
        FinalizedDataModelPage finalizedDataModelPage = browser.page FinalizedDataModelPage
        finalizedDataModelPage.hideConfirmation()
        then:
        at DataModelPage
    }

    def "go to data model acl"() {
        when:
        DataModelPage dataModelPage = browser.page DataModelPage
        dataModelPage.nav.adminMenu()
        dataModelPage.nav.dataModelAcl()
        for (String winHandle : driver.getWindowHandles()) {
            driver.switchTo().window(winHandle);
        }
        then:
        at DataModelAclPermissionsPage
    }

    def "select first created data model and grant curator admin right for it"() {
        when:
        DataModelAclPermissionsPage dataModelAclPermissionsPage = browser.page DataModelAclPermissionsPage
        dataModelAclPermissionsPage.select("FIRST_TESTING_MODEL")
        then:
        at DataModelAclPermissionsShowPage

        when:
        DataModelAclPermissionsShowPage dataModelAclPermissionsShowPage = browser.page DataModelAclPermissionsShowPage
        dataModelAclPermissionsShowPage.grant("curator", "administration")
        then:
        at DataModelAclPermissionsShowPage

    }

    def "select second created data model and grant curator admin right for it"() {
        when:
        DataModelAclPermissionsPage dataModelAclPermissionsPage = to DataModelAclPermissionsPage
        dataModelAclPermissionsPage.select("SECOND_TESTING_MODEL")
        then:
        at DataModelAclPermissionsShowPage

        when:
        DataModelAclPermissionsShowPage dataModelAclPermissionsShowPage = browser.page DataModelAclPermissionsShowPage
        dataModelAclPermissionsShowPage.grant("curator", "administration")
        then:
        at DataModelAclPermissionsShowPage
    }

    def "logout as supervisor"() {
        when:
        DataModelAclPermissionsShowPage dataModelAclPermissionsShowPage = browser.page DataModelAclPermissionsShowPage
        dataModelAclPermissionsShowPage.nav.userMenu()
        dataModelAclPermissionsShowPage.nav.logout()
        then:
        at HomePage
    }

    def "login as curator"() {
        when:
        LoginPage loginPage = to LoginPage
        loginPage.login('curator', 'curator')
        then:
        at DashboardPage
    }

    def "select first data model create"() {
        when:
        DashboardPage dashboardPage = browser.page DashboardPage
        dashboardPage.select("FIRST_TESTING_MODEL")
        then:
        at DataModelPage
    }

    def "go to data classes page and click create new data class"() {
        when:
        DataModelPage dataModelPage = browser.page DataModelPage
        dataModelPage.treeView.dataClasses()
        then:
        at DataClassesPage

        when:
        DataClassesPage dataClassesPage = browser.page DataClassesPage
        dataClassesPage.createDataClass()
        then:
        at CreateDataClassPage
    }

    def "clone data class"() {
        when:
        CreateDataClassPage createDataClassPage = browser.page CreateDataClassPage
        createDataClassPage.cloneDataClass()
        then:
        at CloneDataModelPage

        when:
        CloneDataModelPage cloneDataModelPage = browser.page CloneDataModelPage
        cloneDataModelPage.searchMore()
        then:
        at SearchTagPage

        when:
        SearchTagPage searchTagPage = browser.page SearchTagPage
        searchTagPage.enterSearchBar("THIRD_TESTING_CLASS")
        then: "verfiy name of third  does not appears"
        searchTagPage.noResultFound()

        when:
        searchTagPage = browser.page SearchTagPage
        searchTagPage.addImport()
        then:
        at ImportDataModelPage

        when:
        ImportDataModelPage importDataModelPage = browser.page ImportDataModelPage
        importDataModelPage.searchMore()
        then:
        at SearchTagPage

        when:
        searchTagPage = browser.page SearchTagPage
        then: "verify data class for third model is not in list"
        !searchTagPage.tagPresent("THIRD_TESTING_CLASS")
    }

    def "close the models"() {
        when:
        SearchTagPage searchTagPage = browser.page SearchTagPage
        searchTagPage.close()
        then:
        at ImportDataModelPage

        when:
        ImportDataModelPage importDataModelPage = browser.page ImportDataModelPage
        importDataModelPage.close()
        then:
        at SearchTagPage

        when:
        searchTagPage = browser.page SearchTagPage
        searchTagPage.close()
        then:
        at CloneDataModelPage

        when:
        CloneDataModelPage cloneDataModelPage = browser.page CloneDataModelPage
        cloneDataModelPage.close()
        then:
        at CreateDataClassPage

        when:
        CreateDataClassPage createDataClassPage = browser.page CreateDataClassPage
        createDataClassPage.close()
        createDataClassPage.confirmClose()
        then:
        at DataClassesPage
    }

}