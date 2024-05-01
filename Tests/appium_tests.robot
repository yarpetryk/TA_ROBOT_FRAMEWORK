*** Settings ***
Resource  ../Keywords/appium_keywords.robot

Suite Setup  Log  QA team i am inside suit setup
Suite Teardown  Log  QA team i am inside suit teardown
Test Setup  Log  QA team i am inside test setup
Test Teardown  Log  QA team i am inside test teardown


*** Variables ***
${NAME}    Yaroslav
${AGE}     34
${HEIGHT}  179
${WEIGHT}  78


*** Test Cases ***
Create new user
    [Tags]  boxx_app
    Open app
    Create new user                ${NAME}    ${AGE}    ${HEIGHT}    ${WEIGHT}
    Page Should Contain Text       ${NAME}
    Delete user                    ${NAME}
    Page Should Not Contain Text   ${NAME}
