*** Settings ***
Documentation        Actions and elements of the measurement submission screen

Library    AppiumLibrary

*** Keywords ***

Update weight and height
    [Arguments]    ${account}

    Input Text      xpath=//android.widget.EditText[@resource-id="weight"]    ${account}[weight]
    Input Text      xpath=//android.widget.EditText[@resource-id="height"]    ${account}[height]
    Click Element   xpath=//android.widget.TextView[@text="Enviar minhas medidas"]