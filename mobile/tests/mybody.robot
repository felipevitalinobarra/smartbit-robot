*** Settings ***
Documentation        Test suite for the measurement registration functionality in the Android application

Resource    ../resources/Base.resource

Test Setup        Start Session
Test Teardown     Finish Session

*** Test Cases ***

Should be able to register my measurements

    ${data}    Get JSON fixture    update
    Insert Membership    ${data}

    Signin with document    ${data}[account][cpf]
    User is logged in
    Navigate to my body screen
    Update weight and height    ${data}[account]
    Popup have text    Seu cadastro foi atualizado com sucesso

    Set user token
    ${account}    Get account by name    ${data}[account][name]

    Should Be Equal    ${account}[weight]    ${data}[account][weight]
    Should Be Equal    ${account}[height]    ${data}[account][height]