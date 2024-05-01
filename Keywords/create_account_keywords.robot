*** Settings ***
Library  SeleniumLibrary
Library  ../Custom_libraries/GenerateUser.py
Resource  ../Locators/create_account _locators.robot

*** Variables ***
${URL}       https://sharelane.com/cgi-bin/main.py

*** Keywords ***
Create new account
     [Arguments]          ${BROWSER}
     open browser         ${URL}                     ${BROWSER}
     Click Element        ${SIGN_UP_BUTTON}
     ${ZIP_CODE_VALUE}=   Zip Code
     Input Text           ${ZIP_CODE_FIELD}          ${ZIP_CODE_VALUE}
     Click Element        ${CONTINUE_BUTTON}
     ${FIRST_NAME}=       first_name
     Input Text           ${FIRST_NAME_FIELD}        ${FIRST_NAME}
     ${LAST_NAME}=        last_name
     Input Text           ${LAST_NAME_FIELD}         ${LAST_NAME}
     ${EMAIL}=            email
     Input Text           ${EMAIL_FIELD}             ${EMAIL}
     Input Text           ${PASSWORD_FIELD}          15655
     Input Text           ${CONFIRM_PASSWORD_FIELD}  15655
     Click Element        ${REGISTER_BUTTON}
     Page Should Contain   Account is created!
     close browser

Empty zip code
    [Arguments]          ${BROWSER}
    open browser         ${URL}  ${BROWSER}
    Click Element        ${SIGN_UP_BUTTON}
    Click Element        ${CONTINUE_BUTTON}
    Page Should Contain  Oops, error on page. ZIP code should have 5 digits
    close browser

1 digit of zip code
    [Arguments]          ${BROWSER}
    open browser         ${URL}  ${BROWSER}
    Click Element        ${SIGN_UP_BUTTON}
    Input Text           ${ZIP_CODE_FIELD}  2
    Click Element        ${CONTINUE_BUTTON}
    Page Should Contain  Oops, error on page. ZIP code should have 5 digits
    close browser

More than 5 digits of zip code
    [Arguments]          ${BROWSER}
    open browser         ${URL}  ${BROWSER}
    Click Element        ${SIGN_UP_BUTTON}
    Input Text           ${ZIP_CODE_FIELD}  123456
    Click Element        ${CONTINUE_BUTTON}
    Page Should Contain  Oops, error on page. ZIP code should have 5 digits
    close browser
