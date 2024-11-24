*** Settings ***
Documentation        Robot project main file

Library     JSONLibrary
Library     Browser
Library     Collections
Library     libs/Account.py
Library     libs/Database.py

Resource    Env.resource

Resource    pages/Landing.resource
Resource    pages/Welcome.resource
Resource    pages/Login.resource
Resource    pages/Accounts.resource
Resource    pages/Memberships.resource

Resource    pages/components/Toast.resource
Resource    pages/components/BoxNotice.resource
Resource    pages/components/Navbar.resource
Resource    pages/components/Modal.resource

*** Variables ***
${ADMIN_EMAIL}        sac@smartbit.com
${ADMIN_PASS}         pwd123

*** Keywords ***
Start Session

    New Browser    browser=${BROWSER}    headless=${HEADLESS}
    New Page       ${URL}

Finish Session

    Take Screenshot    fullPage=True

Get JSON fixture
    [Arguments]     ${file_name}    ${scenario}

    ${data}    Load Json From File    
    ...    ${EXECDIR}/resources/fixtures/${file_name}.json
    ...    encoding=utf-8

    [RETURN]    ${data}[${scenario}]

SignIn Admin

    Go to Login Page
    Submit Login Form    ${ADMIN_EMAIL}    ${ADMIN_PASS}
    User is logged in    ${ADMIN_EMAIL}