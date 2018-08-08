#!/bin/bash
# Generated from generateFunctionalTestScript.sh
TEST_REPORT_DIR="$(./testReport.sh)"

if [ ! -d "$TEST_REPORT_DIR" ]
then
    echo "first argument "$TEST_REPORT_DIR" needs to be a directory path"
    exit 1
fi
touch "${TEST_REPORT_DIR}/overallTestReport.txt"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: UserIsAbleToDownloadAnAssetSpec CanCreateDataTypeFromCreateDataElementWizardSpec AddAndRemoveManyDataElementsSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran UserIsAbleToDownloadAnAssetSpec CanCreateDataTypeFromCreateDataElementWizardSpec AddAndRemoveManyDataElementsSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/1_UserIsAbleToDownloadAnAssetSpec_CanCreateDataTypeFromCreateDataElementWizardSpec_AddAndRemoveManyDataElementsSpec"; mv target/test-reports "${TEST_REPORT_DIR}/1_UserIsAbleToDownloadAnAssetSpec_CanCreateDataTypeFromCreateDataElementWizardSpec_AddAndRemoveManyDataElementsSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CheckCreateElementFromClassWizardSpec MaxOccursShowsInHistorySpec NewDraftEditFromImportedModelsAreUpdatedSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CheckCreateElementFromClassWizardSpec MaxOccursShowsInHistorySpec NewDraftEditFromImportedModelsAreUpdatedSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/2_CheckCreateElementFromClassWizardSpec_MaxOccursShowsInHistorySpec_NewDraftEditFromImportedModelsAreUpdatedSpec"; mv target/test-reports "${TEST_REPORT_DIR}/2_CheckCreateElementFromClassWizardSpec_MaxOccursShowsInHistorySpec_NewDraftEditFromImportedModelsAreUpdatedSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: VerifyMinOccursCanBeZeroSpec CheckDataModelCanBeFinalizedSpec CheckDataModelPoliciesSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran VerifyMinOccursCanBeZeroSpec CheckDataModelCanBeFinalizedSpec CheckDataModelPoliciesSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/3_VerifyMinOccursCanBeZeroSpec_CheckDataModelCanBeFinalizedSpec_CheckDataModelPoliciesSpec"; mv target/test-reports "${TEST_REPORT_DIR}/3_VerifyMinOccursCanBeZeroSpec_CheckDataModelCanBeFinalizedSpec_CheckDataModelPoliciesSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CheckDataModelPolicyEnumeratedTypeSpec CheckDataModelPolicyTagSpec CloneUnauthorizedElementSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CheckDataModelPolicyEnumeratedTypeSpec CheckDataModelPolicyTagSpec CloneUnauthorizedElementSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/4_CheckDataModelPolicyEnumeratedTypeSpec_CheckDataModelPolicyTagSpec_CloneUnauthorizedElementSpec"; mv target/test-reports "${TEST_REPORT_DIR}/4_CheckDataModelPolicyEnumeratedTypeSpec_CheckDataModelPolicyTagSpec_CloneUnauthorizedElementSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CreateNewVersionOfDataModelSpec CannotCreateDataElementWithUnauthorizedDataTypeSpec CheckDataTypeAddedToNewVersionSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CreateNewVersionOfDataModelSpec CannotCreateDataElementWithUnauthorizedDataTypeSpec CheckDataTypeAddedToNewVersionSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/5_CreateNewVersionOfDataModelSpec_CannotCreateDataElementWithUnauthorizedDataTypeSpec_CheckDataTypeAddedToNewVersionSpec"; mv target/test-reports "${TEST_REPORT_DIR}/5_CreateNewVersionOfDataModelSpec_CannotCreateDataElementWithUnauthorizedDataTypeSpec_CheckDataTypeAddedToNewVersionSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: ValidateValueAgainstDataTypeSpec CannotAddAssetToFinalizedDataModelSpec CannotAddBusinessRulesToFinalizedDataModelSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran ValidateValueAgainstDataTypeSpec CannotAddAssetToFinalizedDataModelSpec CannotAddBusinessRulesToFinalizedDataModelSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/6_ValidateValueAgainstDataTypeSpec_CannotAddAssetToFinalizedDataModelSpec_CannotAddBusinessRulesToFinalizedDataModelSpec"; mv target/test-reports "${TEST_REPORT_DIR}/6_ValidateValueAgainstDataTypeSpec_CannotAddAssetToFinalizedDataModelSpec_CannotAddBusinessRulesToFinalizedDataModelSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CannotAddDataClassesToFinalizedDataModelSpec CannotAddDataElementsToFinalizedDataModelSpec CannotAddDataTypesToFinalizedDataModelSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CannotAddDataClassesToFinalizedDataModelSpec CannotAddDataElementsToFinalizedDataModelSpec CannotAddDataTypesToFinalizedDataModelSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/7_CannotAddDataClassesToFinalizedDataModelSpec_CannotAddDataElementsToFinalizedDataModelSpec_CannotAddDataTypesToFinalizedDataModelSpec"; mv target/test-reports "${TEST_REPORT_DIR}/7_CannotAddDataClassesToFinalizedDataModelSpec_CannotAddDataElementsToFinalizedDataModelSpec_CannotAddDataTypesToFinalizedDataModelSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CannotAddElementToFinalizedModelSpec CannotAddMeasurementUnitToFinalizedDataModelSpec CannotAddTagsToFinalizedDataModelSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CannotAddElementToFinalizedModelSpec CannotAddMeasurementUnitToFinalizedDataModelSpec CannotAddTagsToFinalizedDataModelSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/8_CannotAddElementToFinalizedModelSpec_CannotAddMeasurementUnitToFinalizedDataModelSpec_CannotAddTagsToFinalizedDataModelSpec"; mv target/test-reports "${TEST_REPORT_DIR}/8_CannotAddElementToFinalizedModelSpec_CannotAddMeasurementUnitToFinalizedDataModelSpec_CannotAddTagsToFinalizedDataModelSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: AbstractModelCatalogueGebSpec ImportMcSpec ImportXmlAndExcelDataSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran AbstractModelCatalogueGebSpec ImportMcSpec ImportXmlAndExcelDataSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/9_AbstractModelCatalogueGebSpec_ImportMcSpec_ImportXmlAndExcelDataSpec"; mv target/test-reports "${TEST_REPORT_DIR}/9_AbstractModelCatalogueGebSpec_ImportMcSpec_ImportXmlAndExcelDataSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CuratorCanGenerateSuggestionsUsingMappingUtilitySpec CloneAanClassIntoAnotherModelSpec CompareTwoDataModelSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CuratorCanGenerateSuggestionsUsingMappingUtilitySpec CloneAanClassIntoAnotherModelSpec CompareTwoDataModelSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/10_CuratorCanGenerateSuggestionsUsingMappingUtilitySpec_CloneAanClassIntoAnotherModelSpec_CompareTwoDataModelSpec"; mv target/test-reports "${TEST_REPORT_DIR}/10_CuratorCanGenerateSuggestionsUsingMappingUtilitySpec_CloneAanClassIntoAnotherModelSpec_CompareTwoDataModelSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CreateDataModelAndCreatePolicesSpec CreateNewVersionFromFinalisedToDraftSpec CustomMetadataNotCarriedNewVersionSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CreateDataModelAndCreatePolicesSpec CreateNewVersionFromFinalisedToDraftSpec CustomMetadataNotCarriedNewVersionSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/11_CreateDataModelAndCreatePolicesSpec_CreateNewVersionFromFinalisedToDraftSpec_CustomMetadataNotCarriedNewVersionSpec"; mv target/test-reports "${TEST_REPORT_DIR}/11_CreateDataModelAndCreatePolicesSpec_CreateNewVersionFromFinalisedToDraftSpec_CustomMetadataNotCarriedNewVersionSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: InvalidRegistrationSpec MaxOccursIsShowingInHistorySpec VerifyResetPasswordPresentOnLoginPageSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran InvalidRegistrationSpec MaxOccursIsShowingInHistorySpec VerifyResetPasswordPresentOnLoginPageSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/12_InvalidRegistrationSpec_MaxOccursIsShowingInHistorySpec_VerifyResetPasswordPresentOnLoginPageSpec"; mv target/test-reports "${TEST_REPORT_DIR}/12_InvalidRegistrationSpec_MaxOccursIsShowingInHistorySpec_VerifyResetPasswordPresentOnLoginPageSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: VerifyUserCanTagUsingTreeViewSpec AbleToNavigateToOldVersionOfAModelThroughTreeSpec CanCreateDataElementAndCloneDataTypeSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran VerifyUserCanTagUsingTreeViewSpec AbleToNavigateToOldVersionOfAModelThroughTreeSpec CanCreateDataElementAndCloneDataTypeSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/13_VerifyUserCanTagUsingTreeViewSpec_AbleToNavigateToOldVersionOfAModelThroughTreeSpec_CanCreateDataElementAndCloneDataTypeSpec"; mv target/test-reports "${TEST_REPORT_DIR}/13_VerifyUserCanTagUsingTreeViewSpec_AbleToNavigateToOldVersionOfAModelThroughTreeSpec_CanCreateDataElementAndCloneDataTypeSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CanCreateDataTypeSpec CanImportDataModelSpec CannotAddAssetToFinalizedDataModelSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CanCreateDataTypeSpec CanImportDataModelSpec CannotAddAssetToFinalizedDataModelSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/14_CanCreateDataTypeSpec_CanImportDataModelSpec_CannotAddAssetToFinalizedDataModelSpec"; mv target/test-reports "${TEST_REPORT_DIR}/14_CanCreateDataTypeSpec_CanImportDataModelSpec_CannotAddAssetToFinalizedDataModelSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CannotAddBusinessRulesToFinalizedDataModelSpec CannotAddDataClassesToFinalizedDataModelSpec CannotAddDataTypesToFinalizedDataModelSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CannotAddBusinessRulesToFinalizedDataModelSpec CannotAddDataClassesToFinalizedDataModelSpec CannotAddDataTypesToFinalizedDataModelSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/15_CannotAddBusinessRulesToFinalizedDataModelSpec_CannotAddDataClassesToFinalizedDataModelSpec_CannotAddDataTypesToFinalizedDataModelSpec"; mv target/test-reports "${TEST_REPORT_DIR}/15_CannotAddBusinessRulesToFinalizedDataModelSpec_CannotAddDataClassesToFinalizedDataModelSpec_CannotAddDataTypesToFinalizedDataModelSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CannotAddMeasurementUnitToFinalizedDataModelSpec CannotAddTagsToFinalizedDataModelSpec CannotDeleteFinalizedDataModelSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CannotAddMeasurementUnitToFinalizedDataModelSpec CannotAddTagsToFinalizedDataModelSpec CannotDeleteFinalizedDataModelSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/16_CannotAddMeasurementUnitToFinalizedDataModelSpec_CannotAddTagsToFinalizedDataModelSpec_CannotDeleteFinalizedDataModelSpec"; mv target/test-reports "${TEST_REPORT_DIR}/16_CannotAddMeasurementUnitToFinalizedDataModelSpec_CannotAddTagsToFinalizedDataModelSpec_CannotDeleteFinalizedDataModelSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CanSelectPoliciesWhileCreatingDataModelSpec FinalizedDataModelIsMarkedAsFinalizedInXMLSpec HistoryIsPopulatedAccordingToModelActivitySpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CanSelectPoliciesWhileCreatingDataModelSpec FinalizedDataModelIsMarkedAsFinalizedInXMLSpec HistoryIsPopulatedAccordingToModelActivitySpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/17_CanSelectPoliciesWhileCreatingDataModelSpec_FinalizedDataModelIsMarkedAsFinalizedInXMLSpec_HistoryIsPopulatedAccordingToModelActivitySpec"; mv target/test-reports "${TEST_REPORT_DIR}/17_CanSelectPoliciesWhileCreatingDataModelSpec_FinalizedDataModelIsMarkedAsFinalizedInXMLSpec_HistoryIsPopulatedAccordingToModelActivitySpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: ImportAndRemoveDataModelReflectsInHistorySpec UnableToImportIfReadAccessSpec UserCanFinalizeDataModelSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran ImportAndRemoveDataModelReflectsInHistorySpec UnableToImportIfReadAccessSpec UserCanFinalizeDataModelSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/18_ImportAndRemoveDataModelReflectsInHistorySpec_UnableToImportIfReadAccessSpec_UserCanFinalizeDataModelSpec"; mv target/test-reports "${TEST_REPORT_DIR}/18_ImportAndRemoveDataModelReflectsInHistorySpec_UnableToImportIfReadAccessSpec_UserCanFinalizeDataModelSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: AdminCanCreateModelAndPolicySpec AdminUserCannotDeleteFinalizedItemsSpec CheckAdminCanDeleteImportedModelSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran AdminCanCreateModelAndPolicySpec AdminUserCannotDeleteFinalizedItemsSpec CheckAdminCanDeleteImportedModelSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/19_AdminCanCreateModelAndPolicySpec_AdminUserCannotDeleteFinalizedItemsSpec_CheckAdminCanDeleteImportedModelSpec"; mv target/test-reports "${TEST_REPORT_DIR}/19_AdminCanCreateModelAndPolicySpec_AdminUserCannotDeleteFinalizedItemsSpec_CheckAdminCanDeleteImportedModelSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CuratorCanCreateANewDataClassSpec CuratorCanEditDataClassesForAdminDataModelSpec CuratorCanImportFinalizedDataModelSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CuratorCanCreateANewDataClassSpec CuratorCanEditDataClassesForAdminDataModelSpec CuratorCanImportFinalizedDataModelSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/20_CuratorCanCreateANewDataClassSpec_CuratorCanEditDataClassesForAdminDataModelSpec_CuratorCanImportFinalizedDataModelSpec"; mv target/test-reports "${TEST_REPORT_DIR}/20_CuratorCanCreateANewDataClassSpec_CuratorCanEditDataClassesForAdminDataModelSpec_CuratorCanImportFinalizedDataModelSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CuratorCannotCreateClassInFinalizedModelSpec CuratorCannotEditFinalizedModelSpec CuratorWithAdminCanDeleteClassInDraftModelSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CuratorCannotCreateClassInFinalizedModelSpec CuratorCannotEditFinalizedModelSpec CuratorWithAdminCanDeleteClassInDraftModelSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/21_CuratorCannotCreateClassInFinalizedModelSpec_CuratorCannotEditFinalizedModelSpec_CuratorWithAdminCanDeleteClassInDraftModelSpec"; mv target/test-reports "${TEST_REPORT_DIR}/21_CuratorCannotCreateClassInFinalizedModelSpec_CuratorCannotEditFinalizedModelSpec_CuratorWithAdminCanDeleteClassInDraftModelSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: DisableUserSpec FinalizedDataModelMenuVisibilitySpec UserCannotEditReadOnlyDataModelSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran DisableUserSpec FinalizedDataModelMenuVisibilitySpec UserCannotEditReadOnlyDataModelSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/22_DisableUserSpec_FinalizedDataModelMenuVisibilitySpec_UserCannotEditReadOnlyDataModelSpec"; mv target/test-reports "${TEST_REPORT_DIR}/22_DisableUserSpec_FinalizedDataModelMenuVisibilitySpec_UserCannotEditReadOnlyDataModelSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: UsersDontSeeUnauthorizedDataModelsSpec VerifyCuratorCannotDeleteFinalizedDataModelSpec VerifyRegularUserCanSeeApiKeySpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran UsersDontSeeUnauthorizedDataModelsSpec VerifyCuratorCannotDeleteFinalizedDataModelSpec VerifyRegularUserCanSeeApiKeySpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/23_UsersDontSeeUnauthorizedDataModelsSpec_VerifyCuratorCannotDeleteFinalizedDataModelSpec_VerifyRegularUserCanSeeApiKeySpec"; mv target/test-reports "${TEST_REPORT_DIR}/23_UsersDontSeeUnauthorizedDataModelsSpec_VerifyCuratorCannotDeleteFinalizedDataModelSpec_VerifyRegularUserCanSeeApiKeySpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: VerifySupervisorCanActionSettingsSpec VerifyViewerCannotAccessFactActionsSpec ApiKeySpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran VerifySupervisorCanActionSettingsSpec VerifyViewerCannotAccessFactActionsSpec ApiKeySpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/24_VerifySupervisorCanActionSettingsSpec_VerifyViewerCannotAccessFactActionsSpec_ApiKeySpec"; mv target/test-reports "${TEST_REPORT_DIR}/24_VerifySupervisorCanActionSettingsSpec_VerifyViewerCannotAccessFactActionsSpec_ApiKeySpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CreateAssetsAndImportDataSpec CreateBusinessRulesSpec CreateDataClassSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CreateAssetsAndImportDataSpec CreateBusinessRulesSpec CreateDataClassSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/25_CreateAssetsAndImportDataSpec_CreateBusinessRulesSpec_CreateDataClassSpec"; mv target/test-reports "${TEST_REPORT_DIR}/25_CreateAssetsAndImportDataSpec_CreateBusinessRulesSpec_CreateDataClassSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CreateDataModelSpec CreateDataTypeAndSelectEnumeratedSpec CreateDataTypeAndSelectReferenceSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CreateDataModelSpec CreateDataTypeAndSelectEnumeratedSpec CreateDataTypeAndSelectReferenceSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/26_CreateDataModelSpec_CreateDataTypeAndSelectEnumeratedSpec_CreateDataTypeAndSelectReferenceSpec"; mv target/test-reports "${TEST_REPORT_DIR}/26_CreateDataModelSpec_CreateDataTypeAndSelectEnumeratedSpec_CreateDataTypeAndSelectReferenceSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CreateDataTypeAndSelectSubsetSpec CreateMeasurementUnitSpec CreateNewDataElementSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CreateDataTypeAndSelectSubsetSpec CreateMeasurementUnitSpec CreateNewDataElementSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/27_CreateDataTypeAndSelectSubsetSpec_CreateMeasurementUnitSpec_CreateNewDataElementSpec"; mv target/test-reports "${TEST_REPORT_DIR}/27_CreateDataTypeAndSelectSubsetSpec_CreateMeasurementUnitSpec_CreateNewDataElementSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CreateRelationshipSpec CreateTagSpec SearchMoreOptionPolicySpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CreateRelationshipSpec CreateTagSpec SearchMoreOptionPolicySpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/28_CreateRelationshipSpec_CreateTagSpec_SearchMoreOptionPolicySpec"; mv target/test-reports "${TEST_REPORT_DIR}/28_CreateRelationshipSpec_CreateTagSpec_SearchMoreOptionPolicySpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CreateDataTypeAndSelectPrimitiveSpec DataModelSearchSpec CreateMeasurementUnitFromFavouritesSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CreateDataTypeAndSelectPrimitiveSpec DataModelSearchSpec CreateMeasurementUnitFromFavouritesSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/29_CreateDataTypeAndSelectPrimitiveSpec_DataModelSearchSpec_CreateMeasurementUnitFromFavouritesSpec"; mv target/test-reports "${TEST_REPORT_DIR}/29_CreateDataTypeAndSelectPrimitiveSpec_DataModelSearchSpec_CreateMeasurementUnitFromFavouritesSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: DevSupportedLinkSpec AddDataInToFavouritesSpec AddDataModelImportSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran DevSupportedLinkSpec AddDataInToFavouritesSpec AddDataModelImportSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/30_DevSupportedLinkSpec_AddDataInToFavouritesSpec_AddDataModelImportSpec"; mv target/test-reports "${TEST_REPORT_DIR}/30_DevSupportedLinkSpec_AddDataInToFavouritesSpec_AddDataModelImportSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: AddUsernameToFavouriteSpec CodeVersionSpec EditDataElementSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran AddUsernameToFavouriteSpec CodeVersionSpec EditDataElementSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/31_AddUsernameToFavouriteSpec_CodeVersionSpec_EditDataElementSpec"; mv target/test-reports "${TEST_REPORT_DIR}/31_AddUsernameToFavouriteSpec_CodeVersionSpec_EditDataElementSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: LastSeenSpec ModelCatalogueDevelopmentSpec NavItemVisibilitySpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran LastSeenSpec ModelCatalogueDevelopmentSpec NavItemVisibilitySpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/32_LastSeenSpec_ModelCatalogueDevelopmentSpec_NavItemVisibilitySpec"; mv target/test-reports "${TEST_REPORT_DIR}/32_LastSeenSpec_ModelCatalogueDevelopmentSpec_NavItemVisibilitySpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: QuickSearchSpec RelationshipHasAttachmentOfSpec RelationshipImportsSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran QuickSearchSpec RelationshipHasAttachmentOfSpec RelationshipImportsSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/33_QuickSearchSpec_RelationshipHasAttachmentOfSpec_RelationshipImportsSpec"; mv target/test-reports "${TEST_REPORT_DIR}/33_QuickSearchSpec_RelationshipHasAttachmentOfSpec_RelationshipImportsSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: RelationshipIsBaseForSpec RelationshipIsImportedBySpec RelationshipIsSynonymForSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran RelationshipIsBaseForSpec RelationshipIsImportedBySpec RelationshipIsSynonymForSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/34_RelationshipIsBaseForSpec_RelationshipIsImportedBySpec_RelationshipIsSynonymForSpec"; mv target/test-reports "${TEST_REPORT_DIR}/34_RelationshipIsBaseForSpec_RelationshipIsImportedBySpec_RelationshipIsSynonymForSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: RelationshipRelatedToSpec SearchCatalogueModelsSpec LoginAsViewerSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran RelationshipRelatedToSpec SearchCatalogueModelsSpec LoginAsViewerSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/35_RelationshipRelatedToSpec_SearchCatalogueModelsSpec_LoginAsViewerSpec"; mv target/test-reports "${TEST_REPORT_DIR}/35_RelationshipRelatedToSpec_SearchCatalogueModelsSpec_LoginAsViewerSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: LoginInAndClickOnCancelSpec LoginSpec ResetPasswordSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran LoginInAndClickOnCancelSpec LoginSpec ResetPasswordSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/36_LoginInAndClickOnCancelSpec_LoginSpec_ResetPasswordSpec"; mv target/test-reports "${TEST_REPORT_DIR}/36_LoginInAndClickOnCancelSpec_LoginSpec_ResetPasswordSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: ValidateRegistrationSpec LogoutSpec ApiKeyUrlMappingsSecuredSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran ValidateRegistrationSpec LogoutSpec ApiKeyUrlMappingsSecuredSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/37_ValidateRegistrationSpec_LogoutSpec_ApiKeyUrlMappingsSecuredSpec"; mv target/test-reports "${TEST_REPORT_DIR}/37_ValidateRegistrationSpec_LogoutSpec_ApiKeyUrlMappingsSecuredSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: CatalogueElementUrlMappingsSecuredSpec ClassificationUrlMappingsSecuredSpec CsvTransformationUrlMappingsSecuredSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran CatalogueElementUrlMappingsSecuredSpec ClassificationUrlMappingsSecuredSpec CsvTransformationUrlMappingsSecuredSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/38_CatalogueElementUrlMappingsSecuredSpec_ClassificationUrlMappingsSecuredSpec_CsvTransformationUrlMappingsSecuredSpec"; mv target/test-reports "${TEST_REPORT_DIR}/38_CatalogueElementUrlMappingsSecuredSpec_ClassificationUrlMappingsSecuredSpec_CsvTransformationUrlMappingsSecuredSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: DataArchitectUrlMappingsSecuredSpec DataClassUrlMappingsSecuredSpec DataElementUrlMappingsSecuredSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran DataArchitectUrlMappingsSecuredSpec DataClassUrlMappingsSecuredSpec DataElementUrlMappingsSecuredSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/39_DataArchitectUrlMappingsSecuredSpec_DataClassUrlMappingsSecuredSpec_DataElementUrlMappingsSecuredSpec"; mv target/test-reports "${TEST_REPORT_DIR}/39_DataArchitectUrlMappingsSecuredSpec_DataClassUrlMappingsSecuredSpec_DataElementUrlMappingsSecuredSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: DataImportCreateUrlMappingsSecuredSpec DataModelPolicyUrlMappingsSecuredSpec DataModelUrlMappingsSecuredSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran DataImportCreateUrlMappingsSecuredSpec DataModelPolicyUrlMappingsSecuredSpec DataModelUrlMappingsSecuredSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/40_DataImportCreateUrlMappingsSecuredSpec_DataModelPolicyUrlMappingsSecuredSpec_DataModelUrlMappingsSecuredSpec"; mv target/test-reports "${TEST_REPORT_DIR}/40_DataImportCreateUrlMappingsSecuredSpec_DataModelPolicyUrlMappingsSecuredSpec_DataModelUrlMappingsSecuredSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: DataTypeUrlMappingsSecuredSpec EnumeratedTypeUrlMappingsSecuredSpec LastSeenUrlMappingsSecuredSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran DataTypeUrlMappingsSecuredSpec EnumeratedTypeUrlMappingsSecuredSpec LastSeenUrlMappingsSecuredSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/41_DataTypeUrlMappingsSecuredSpec_EnumeratedTypeUrlMappingsSecuredSpec_LastSeenUrlMappingsSecuredSpec"; mv target/test-reports "${TEST_REPORT_DIR}/41_DataTypeUrlMappingsSecuredSpec_EnumeratedTypeUrlMappingsSecuredSpec_LastSeenUrlMappingsSecuredSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: LogsUrlMappingsSecuredSpec MeasurementUnitUrlMappingsSecuredSpec ModelCatalogueCorePluginUrlMappingsSecuredSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran LogsUrlMappingsSecuredSpec MeasurementUnitUrlMappingsSecuredSpec ModelCatalogueCorePluginUrlMappingsSecuredSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/42_LogsUrlMappingsSecuredSpec_MeasurementUnitUrlMappingsSecuredSpec_ModelCatalogueCorePluginUrlMappingsSecuredSpec"; mv target/test-reports "${TEST_REPORT_DIR}/42_LogsUrlMappingsSecuredSpec_MeasurementUnitUrlMappingsSecuredSpec_ModelCatalogueCorePluginUrlMappingsSecuredSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: ModelCatalogueFormsUrlMappingsSecuredSpec ModelCatalogueGenomicsUrlMappingsSecuredSpec ModelCatalogueNorthThamesUrlMappingsSecuredSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran ModelCatalogueFormsUrlMappingsSecuredSpec ModelCatalogueGenomicsUrlMappingsSecuredSpec ModelCatalogueNorthThamesUrlMappingsSecuredSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/43_ModelCatalogueFormsUrlMappingsSecuredSpec_ModelCatalogueGenomicsUrlMappingsSecuredSpec_ModelCatalogueNorthThamesUrlMappingsSecuredSpec"; mv target/test-reports "${TEST_REPORT_DIR}/43_ModelCatalogueFormsUrlMappingsSecuredSpec_ModelCatalogueGenomicsUrlMappingsSecuredSpec_ModelCatalogueNorthThamesUrlMappingsSecuredSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: ModelCatalogueVersionUrlMappingsSecuredSpec ReindexCatalogueUrlMappingsSecuredSpec UserUrlMappingSecuredSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran ModelCatalogueVersionUrlMappingsSecuredSpec ReindexCatalogueUrlMappingsSecuredSpec UserUrlMappingSecuredSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/44_ModelCatalogueVersionUrlMappingsSecuredSpec_ReindexCatalogueUrlMappingsSecuredSpec_UserUrlMappingSecuredSpec"; mv target/test-reports "${TEST_REPORT_DIR}/44_ModelCatalogueVersionUrlMappingsSecuredSpec_ReindexCatalogueUrlMappingsSecuredSpec_UserUrlMappingSecuredSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: GrantRoleCuratorSpec AssetWizardSpec BatchAndActionsSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran GrantRoleCuratorSpec AssetWizardSpec BatchAndActionsSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/45_GrantRoleCuratorSpec_AssetWizardSpec_BatchAndActionsSpec"; mv target/test-reports "${TEST_REPORT_DIR}/45_GrantRoleCuratorSpec_AssetWizardSpec_BatchAndActionsSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: ChangeLogForEligibilitySpec ChangesSpec DataClassWizardSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran ChangeLogForEligibilitySpec ChangesSpec DataClassWizardSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/46_ChangeLogForEligibilitySpec_ChangesSpec_DataClassWizardSpec"; mv target/test-reports "${TEST_REPORT_DIR}/46_ChangeLogForEligibilitySpec_ChangesSpec_DataClassWizardSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: DataElementWizardSpec DataModelWizardSpec DataTypeWizardSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran DataElementWizardSpec DataModelWizardSpec DataTypeWizardSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/47_DataElementWizardSpec_DataModelWizardSpec_DataTypeWizardSpec"; mv target/test-reports "${TEST_REPORT_DIR}/47_DataElementWizardSpec_DataModelWizardSpec_DataTypeWizardSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: MeasurementUnitWizardSpec RegisterSpec SearchFunctionalSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran MeasurementUnitWizardSpec RegisterSpec SearchFunctionalSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/48_MeasurementUnitWizardSpec_RegisterSpec_SearchFunctionalSpec"; mv target/test-reports "${TEST_REPORT_DIR}/48_MeasurementUnitWizardSpec_RegisterSpec_SearchFunctionalSpec"
./grailsw test-app -Xmx8G -Dgeb.env=chrome -DdownloadFilepath=/home/james/Downloads/functionalTestDownloads -Dwebdriver.chrome.driver=/usr/local/lib/node_modules/chromedriver/bin/chromedriver functional: UsersDontSeeUnauthorizedDataModelsSpec ValidationRuleWizardSpec VersionVerificationSpec | tee -a "${TEST_REPORT_DIR}/overallTestReport.txt"; printf "Just ran UsersDontSeeUnauthorizedDataModelsSpec ValidationRuleWizardSpec VersionVerificationSpec" >> "${TEST_REPORT_DIR}/overallTestReport.txt"
mkdir "${TEST_REPORT_DIR}/49_UsersDontSeeUnauthorizedDataModelsSpec_ValidationRuleWizardSpec_VersionVerificationSpec"; mv target/test-reports "${TEST_REPORT_DIR}/49_UsersDontSeeUnauthorizedDataModelsSpec_ValidationRuleWizardSpec_VersionVerificationSpec"
