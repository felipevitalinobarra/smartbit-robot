*** Settings ***
Documentation        login screen actions and elements

Library    AppiumLibrary

*** Keywords ***
Signin with document
    [Arguments]    ${cpf}

    Input Text       xpath=//android.widget.EditText[@resource-id="ipAddress"]    192.168.16.113
    Input Text       xpath=//android.widget.EditText[@resource-id="cpf"]          ${cpf}
    Click Element    xpath=//android.widget.TextView[@text="Entrar"]