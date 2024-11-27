*** Settings ***
Documentation    Menu components actions and elements

Library    AppiumLibrary

*** Keywords ***
Navigate to my body screen
    Click Element    xpath=//android.widget.TextView[@text="Meu corpo"]
    Wait Until Page Contains    Registre ou atualize suas medidas    5
    
Navigate to my account screen
    Click Element    xpath=//android.widget.TextView[@text="Minha conta"]
    Wait Until Page Contains    Sua transformação começa aqui!    5