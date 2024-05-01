*** Settings ***
Resource  ../Keywords/application_form_keywords.robot
Library  SeleniumLibrary

Suite Setup  Log  QA team i am inside suit setup
Suite Teardown  Log  QA team i am inside suit teardown
Test Setup  Log  QA team i am inside test setup
Test Teardown  Log  QA team i am inside test teardown
Default Tags  sanity

*** Variables ***
${BROWSER}  Chrome

*** Test Cases ***
User fill in application form
    [Tags]  application_form
    Fill in application form  ${BROWSER}

User select option from dropdown
    [Tags]  dropdown
    Select dropdown option  ${BROWSER}