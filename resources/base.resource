*** Settings ***
Documentation        Robot project main file

Library    libs/Account.py
Library    Browser

*** Keywords ***
Start Session

    New Browser    browser=chromium    headless=False
    New Page       localhost:3000
    Wait For Elements State       css=#signup h2 >> text=Faça seu cadastro e venha para a Smartbit!

Finish Session

    Take Screenshot    fullPage=True