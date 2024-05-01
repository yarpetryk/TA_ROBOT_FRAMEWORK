*** Settings ***
Library  SeleniumLibrary
Library  BuiltIn
Library  ../Custom_libraries/GenerateUser.py
Resource  ../Locators/application_form_locator.robot

*** Variables ***
${URL}           https://fd7.formdesk.com/demo/application2
${URL_DROPDOWN}  https://fd7.formdesk.com/demo/marathon.payment2

*** Keywords ***
Fill in application form
     [Arguments]                ${BROWSER}
     open browser               ${URL}                                   ${BROWSER}
     ${USER_DATA_VALUE}=        full_name
     ${USER_DATA_ADDRESS}=      address
     ${USER_ZIP_CODE_VALUE}=    zip_code
     ${USER_CITY_VALUE}=        city
     ${USER_PHONE_VALUE}=       phone_number
     ${USER_EMAIL_VALUE}=       email
     ${USER_BIRTH_DATE_VALUE}=  birth_day
     Click Element              ${USER_GENDER}
     Input Text                 ${USER_NAME}                              ${USER_DATA_VALUE}
     Input Text                 ${USER_ADDRESS}                           ${USER_DATA_ADDRESS}
     Input Text                 ${USER_ZIP_CODE}                          ${USER_ZIP_CODE_VALUE}
     Input Text                 ${USER_CITY}                              ${USER_CITY_VALUE}
     Input Text                 ${USER_PHONE}                             ${USER_PHONE_VALUE}
     Input Text                 ${USER_EMAIL}                             ${USER_EMAIL_VALUE}
     Input Text                 ${USER_BIRTH_DATE}                        ${USER_BIRTH_DATE_VALUE}
     Click Element              ${USER_SUBMIT}
     Sleep                      2s
     Page Should Contain        Thank you very much for your application
     Close Browser

Select dropdown option
     [Arguments]                ${BROWSER}
     open browser               ${URL_DROPDOWN}                           ${BROWSER}
     ${DISTANCE_VALUE}          Set Variable                              Full marathon $ 10,-
     ${LOCKER_VALUE}            Set Variable                              Yes ($ 2,50)
     Select From List By Value  ${DROPDOWN_DISTANCE}                      ${DISTANCE_VALUE}
     Select From List By Value  ${DROPDOWN_LOCKER}                        ${LOCKER_VALUE}
     ${AMOUNT_VALUE}            Set Variable                              12.50
     ${INPUT_AMOUNT_VALUE}      Get Value                                 ${INPUT_AMOUNT}
     Should Be Equal            ${AMOUNT_VALUE}                           ${INPUT_AMOUNT_VALUE}
     Close Browser
