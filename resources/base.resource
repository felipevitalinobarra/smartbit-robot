*** Settings ***
Documentation        Robot project main file

Library     Browser
Library     libs/Account.py
Library     libs/Database.py

Resource    Env.resource

Resource    pages/Landing.resource
Resource    pages/Welcome.resource
Resource    pages/Login.resource
Resource    pages/Accounts.resource

Resource    pages/components/Toast.resource
Resource    pages/components/BoxNotice.resource

*** Keywords ***
Start Session

    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Page       ${URL}

Finish Session

    Take Screenshot    fullPage=True