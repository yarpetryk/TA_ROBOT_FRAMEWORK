*** Settings ***
Resource  ../Keywords/create_account_keywords.robot
Library  SeleniumLibrary

Suite Setup  Log  QA team i am inside suit setup
Suite Teardown  Log  QA team i am inside suit teardown
Test Setup  Log  QA team i am inside test setup
Test Teardown  Log  QA team i am inside test teardown
Default Tags  sanity

*** Variables ***
${BROWSER}  Chrome

*** Test Cases ***

User creates new account
    [Tags]  new_user
    Create new account  ${BROWSER}

User enters empty zip code
    [Tags]  negative_testing
    Empty zip code  ${BROWSER}

User enters 1 digit into zip code
    [Tags]  negative_testing
    1 digit of zip code  ${BROWSER}

User enter mote then 5 digits into zip code field
    [Tags]  negative_testing
    More than 5 digits of zip code  ${BROWSER}
