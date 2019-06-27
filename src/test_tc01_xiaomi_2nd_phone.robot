*** Settings ***
Documentation    As a user, I will visit Alza.cz eshop,
...              find Xiaomi mobile phones products
...              display details of the 2nd found product
...              and save product name and price as two variables.

Library          seleniumLibrary

*** Variables ***
${HOMEPAGE}      https://www.alza.cz/
${BROWSER}       headlesschrome
${PHONE_NAME}    Xiaomi
${NAME}          ${EMPTY}
${PRICE}         ${EMPTY}


*** Test Cases ***
Get Name and Price of 2nd Xiaomi mobile phone
    [Tags]    DEBUG
    Given I Open the ${HOMEPAGE} Website
    When I Find 2nd ${PHONE_NAME} mobile phone
    Then I Save ${NAME} and ${PRICE} of the phone

*** Keywords ***
Given I Open the ${HOMEPAGE} Website
    Open Browser    ${HOMEPAGE}    ${BROWSER}

When I Find 2nd ${PHONE_NAME} mobile phone


Then I Save ${NAME} and ${PRICE} of the phone
