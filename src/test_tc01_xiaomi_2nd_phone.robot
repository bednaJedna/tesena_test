*** Settings ***
Documentation    As a user, I will visit Alza.cz eshop,
...              find Xiaomi mobile phones products
...              display details of the 2nd found product
...              and save product name and price as two variables.

Library          SeleniumLibrary

Test Setup       Open Browser    ${HOMEPAGE}    ${BROwSER}
...              Maximize Browser Window
Test Teardown    Close All Browsers

*** Variables ***
${HOMEPAGE}      https://www.alza.cz/

${BROWSER}       chrome
${PHONE_NAME}    Xiaomi

${SEARCH_INPUT}    //*[@id="edtSearch"]
${SEARCH_BTTN}     //*[@id="btnSearch"]
${SEARCH_PHRASE}    Mobilní telefony Xiaomi

${RESULTS_BOXES}    //*[@id="boxes"]
${BOXES}            //div[@class='top']


${NAME}          ${EMPTY}
${PRICE}         ${EMPTY}


*** Test Cases ***
Get Name and Price of 2nd Xiaomi mobile phone
    [Tags]    DEBUG
    Given I Find 2nd ${PHONE_NAME} mobile phone
    Then I Save ${NAME} and ${PRICE} of the phone

*** Keywords ***
Given I Find 2nd ${PHONE_NAME} mobile phone
    Wait Until Element is Visible    ${SEARCH_INPUT}
    Click Element                    ${SEARCH_INPUT}
    Input Text                       ${SEARCH_PHRASE}
    Wait Until Element is Visible    ${SEARCH_BTTN}
    Click Element                    ${SEARCH_BTTN}
    Wait Until Element is Visible    ${RESULTS_BOXES}

    @{boxes}=    Get WebElements     ${BOXES}





Then I Save ${NAME} and ${PRICE} of the phone
