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