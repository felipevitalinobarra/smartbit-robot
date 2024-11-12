*** Settings ***
Documentation        Robot project main file

Library    libs/Account.py
Library    Browser

*** Keywords ***
Start Session

    New Browser    browser=chromium    headless=False
    New Page       localhost:3000

Finish Session

    Take Screenshot    fullPage=True