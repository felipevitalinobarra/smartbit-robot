*** Settings ***
Documentation        Actions and elements of the my account screen

Library    AppiumLibrary

*** Keywords ***
User is logged in
    ${element}    Set Variable    xpath=//android.widget.TextView[@resource-id="myAccountTitle"]

    Wait Until Element Is Visible    ${element}    10
    Element Text Should Be           ${element}    Sua transformação começa aqui!