*** Settings ***
Documentation        Login Page Actions and Elements

Resource    ../Base.resource

*** Keywords ***
Go to Login Page

    Go To    ${URL}/login

Submit Login Form
    [Arguments]    ${email}    ${password}

    Fill Text    css=input[name=email]       ${email}
    Fill Text    css=input[name=password]    ${password}
    Click        css=button >> text=Entrar