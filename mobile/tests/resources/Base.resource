*** Settings ***
Documentation        Main file of the mobile automated testing project

Library    AppiumLibrary

Resource    ./actions/account.resource
Resource    ./actions/login.resource
Resource    ./actions/menu.resource
Resource    ./actions/mybody.resource

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