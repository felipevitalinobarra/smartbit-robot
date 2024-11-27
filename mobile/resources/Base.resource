*** Settings ***
Documentation        Main file of the mobile automated testing project

Library     AppiumLibrary
Library     JSONLibrary
Library     ../../libs/Account.py
Library     ../../libs/Database.py

Resource    ../../services/Service.resource

Resource    ./actions/account.resource
Resource    ./actions/login.resource
Resource    ./actions/mybody.resource

Resource    ./actions/components/menu.resource
Resource    ./actions/components/popup.resource

*** Keywords ***

Start Session

    Open Application    http://localhost:4723
    ...    platformName=Android
    ...    automationName=UIAutomator2
    ...    deviceName=Emulator
    ...    udid=emulator-5554
    ...    app=${EXECDIR}/app/smartbit-beta.apk
    ...    autoGrantPermissions=true

    Wait Until Page Contains    IP da API    30

Finish Session

    Capture Page Screenshot
    Close Application

Get JSON fixture
    [Arguments]     ${scenario}

    ${data}    Load Json From File    
    ...    ${EXECDIR}/resources/fixtures/data.json
    ...    encoding=utf-8

    [RETURN]    ${data}[${scenario}]