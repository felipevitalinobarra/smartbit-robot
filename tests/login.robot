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
    [Tags]    inv_user
    Go to Login Page
    Submit Login Form    invaliduser@smartbit.com    pwd123
    Toast should be      As credenciais de acesso fornecidas são inválidas. Tente novamente!