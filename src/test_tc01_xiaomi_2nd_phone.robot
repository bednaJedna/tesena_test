*** Settings ***
Documentation    As a user, I will visit Alza.cz eshop,
...              find Xiaomi mobile phones products
...              display details of the 2nd found product
...              and save product name and price as two variables.

Library          SeleniumLibrary

Test Setup       Open Browser    ${HOMEPAGE}    ${BROwSER}
Test Teardown    Close All Browsers

*** Variables ***
${HOMEPAGE}      https://www.alza.cz/

${BROWSER}       chrome
${PHONE_NAME}    Xiaomi

${LOC_SEARCH_INPUT}    //*[@id="edtSearch"]
${LOC_SEARCH_BTTN}     //*[@id="btnSearch"]
${SEARCH_PHRASE}    Mobilní telefony ${PHONE_NAME}

${LOC_RESULTS_BOXES}    //*[@id="boxes"]
${LOC_BOXES}            //div[@class='top']
${LOC_BOX_IMAGE}         //div[@class='bi js-block-image']
${LOC_PHONE_NAME}       //h1[@itemprop='name']
${LOC_PHONE_PRICE}      //span[@class='bigPrice price_withVat']
${LOC_CHATBOT_CLOSE_BTTN}    //div[@class='vendor-close fa fa-times']


${NAME}          ${EMPTY}
${PRICE}         ${EMPTY}


*** Test Cases ***
Get Name and Price of 2nd Xiaomi mobile phone
    [Tags]    DEBUG
    Given I Find 2nd "${PHONE_NAME}" mobile phone
    Then I Save "${NAME}" and "${PRICE}" of the phone

*** Keywords ***
Given I Find 2nd "${PHONE_NAME}" mobile phone
    Maximize Browser Window
    Wait Until Element is Visible    ${LOC_SEARCH_INPUT}
    Click Element                    ${LOC_SEARCH_INPUT}
    Input Text                       ${LOC_SEARCH_INPUT}    ${SEARCH_PHRASE}
    Wait Until Element is Visible    ${LOC_SEARCH_BTTN}
    Click Element                    ${LOC_SEARCH_BTTN}
    Wait Until Element is Visible    ${LOC_RESULTS_BOXES}

    @{boxes_images}=    Get WebElements     ${LOC_BOX_IMAGE}

    Scroll Element Into View         ${boxes_images}[1]

    Set Global Variable              ${BOX_IMAGE}    ${boxes_images}[1]

Then I Save "${NAME}" and "${PRICE}" of the phone
    Set Focus To Element             ${BOX_IMAGE}
    Click Element                    ${BOX_IMAGE}

    Wait Until Element is Visible    ${LOC_PHONE_NAME}
    Wait Until Element is Visible    ${LOC_PHONE_PRICE}

    ${NAME}=     Get Text            ${LOC_PHONE_NAME}
    ${PRICE}=    Get Text            ${LOC_PHONE_PRICE}

    Log                              ${NAME}: ${PRICE}