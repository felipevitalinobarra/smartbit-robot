*** Settings ***
Documentation        Robot project main file

Library     Browser
Library     libs/Account.py

Resource    pages/Landing.resource
Resource    pages/Welcome.resource

*** Keywords ***
Start Session

    New Browser    browser=chromium    headless=False
    New Page       localhost:3000

Finish Session

    Take Screenshot    fullPage=True