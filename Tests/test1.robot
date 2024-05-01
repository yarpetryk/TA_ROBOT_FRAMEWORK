*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${URL}  https://sharelane.com/cgi-bin/main.py
##${BROWSER}  Chrome
${admin_email}  admin@lvolume.net
${admin_password}  hub123456789

*** Test Cases ***
Create account via chrome browser
    User can create new account  Chrome

*** Keywords ***

User can create new account
    [Arguments]  ${BROWSER}
    open browser  ${URL}  ${BROWSER}
    Click Element  css:body > center > table > tbody > tr:nth-child(3) > td > table > tbody > tr > td:nth-child(4) > a
    Input Text  name:zip_code  15655
    Click Element  css:body > center > table > tbody > tr:nth-child(5) > td > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(3) > td:nth-child(2) > input[type=submit]
    Input Text  name:first_name  PEter
    Input Text  name:last_name   Clark
    Input Text  name:email  lsqa@aa.ca
    Input Text  name:password1  15655
    Input Text  name:password2  15655
    Click Element  css:body > center > table > tbody > tr:nth-child(5) > td > table > tbody > tr:nth-child(2) > td > table > tbody > tr:nth-child(6) > td:nth-child(2) > input[type=submit]
    Page Should Contain  Account is creted!
    close browser







