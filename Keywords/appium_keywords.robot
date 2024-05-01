*** Settings ***
Library  AppiumLibrary
Library  BuiltIn
Library  OperatingSystem
Library  StringFormat
Resource  ../Locators/appium_locator.robot


*** Variables ***
${URL}                        http://127.0.0.1:4723/wd/hub
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_PLATFORM_NAME}      Android
${PACKAGE_NAME}               com.lembergsolutions.boxx
${ACTIVITY_NAME}              com.lembergsolutions.boxx.ui.activity.preparation.PreparationActivity
${APP}                        ${CURDIR}/../App/boxx.apk


*** Keywords ***
Open app
     Open Application  ${URL}  automationName=${ANDROID_AUTOMATION_NAME}
     ...  platformName=${ANDROID_PLATFORM_NAME}  autoGrantPermissions=true
     ...  app=${APP}  appPackage=${PACKAGE_NAME}  appActivity=${ACTIVITY_NAME}

Create new user
     [Arguments]      ${USER_NAME_VALUE}  ${USER_AGE_VALUE}  ${USER_HEIGHT_VALUE}    ${USER_WEIGHT_VALUE}
     Click Element                        ${ADD_USER}
     Wait Until Element Is Visible        ${USER_NAME}
     Input Text                           ${USER_NAME}        ${USER_NAME_VALUE}
     Input Text                           ${USER_AGE}         ${USER_AGE_VALUE}
     Input Text                           ${USER_HEIGHT}      ${USER_HEIGHT_VALUE}
     Input Text                           ${USER_WEIGHT}      ${USER_WEIGHT_VALUE}
     Click Element                        ${USER_LEVEL}
     Wait Until Element Is Visible        ${USER_LEVEL_VALUE}
     Click Element                        ${USER_LEVEL_VALUE}
     Click Element                        ${USER_GENDER}
     Wait Until Element Is Visible        ${USER_GENDER_VALUE}
     Click Element                        ${USER_GENDER_VALUE}
     Click Element                        ${USER_STANCE}
     Wait Until Element Is Visible        ${USER_STANCE_VALUE}
     Click Element                        ${USER_STANCE_VALUE}
     Click Element                        ${SAVE_PROFILE}

Delete user
     [Arguments]                          ${USR_NAME_VALUE}
     Click Element                        ${LIST_USERS}
     ${USR_NAME}           Format String  ${SELECT_PROFILE}       ${USR_NAME_VALUE}
     wait until element is visible        ${USR_NAME}
     Click Element                        ${USR_NAME}
     Click Element                        ${DELETE_USER}
     Wait Until Element Is Visible        ${CONFIRM_USER_DELETE}
     Click Element                        ${CONFIRM_USER_DELETE}
