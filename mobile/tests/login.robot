*** Settings ***
Documentation        Login test suite

Resource    ../resources/Base.Resource

Test Setup        Start Session
Test Teardown     Finish Session

*** Test Cases ***

Must log in with document and IP Adress

    ${data}    Get Json Fixture    login
    Insert Membership    ${data}

    Signin with document    ${data}[account][cpf]
    User is logged in

Should not log in with an unregistered CPF
    Signin with document    77759247052
    Popup have text         Acesso não autorizado! Entre em contato com a central de atendimento

Should not log in without document
    Signin with document    ${EMPTY}
    Popup have text         Informe o número do seu CPF

Should not log in with an invalid document
    Signin with document    12345678910
    Popup have text         CPF inválido, tente novamente