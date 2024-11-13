*** Settings ***
Documentation        SAC Login Test Scenarios

Resource          ../resources/Base.resource

Test Setup        Start Session
Test Teardown     Finish Session

*** Test Cases ***
Must log in as gym manager
    Go to Login Page
    Submit Login Form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

Shouldn't log in with an incorrect password
    [Tags]    inv_pass
    Go to Login Page
    Submit Login Form    sac@smartbit.com    invalidpassword
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!
    
Shouldn't log in with an unregistered email address
    [Tags]    unreg_user
    Go to Login Page
    Submit Login Form    invaliduser@smartbit.com    pwd123
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!

Login attempt with incorrect data
    [Template]    Login with verify notice
    ${EMPTY}            ${EMPTY}    Os campos email e senha são obrigatórios.
    sac@smartbit.com    ${EMPTY}    Os campos email e senha são obrigatórios.
    ${EMPTY}            pwd123      Os campos email e senha são obrigatórios.
    www.teste.com.br    pwd123      Oops! O email informado é inválido
    emailgmail.com      pwd123      Oops! O email informado é inválido    
    email@@gmail.com    pwd123      Oops! O email informado é inválido
    email@.com          pwd123      Oops! O email informado é inválido
    email@gmailcom      pwd123      Oops! O email informado é inválido
    email@gmail.        pwd123      Oops! O email informado é inválido
    email()@gmail.com   pwd123      Oops! O email informado é inválido
    email@domain$%.com  pwd123      Oops! O email informado é inválido
    email@ gmail.com    pwd123      Oops! O email informado é inválido
    email@              pwd123      Oops! O email informado é inválido

*** Keywords ***

Login with verify notice
    [Arguments]    ${email}    ${password}    ${output_message}

    Go to Login Page
    Submit Login Form    ${email}    ${password}
    Notice should be     ${output_message}