*** Settings ***
Documentation        Plan Adherence Test Suite

Resource        ../resources/Base.resource

Test Setup        Start Session
Test Teardown     Finish Session

*** Test Cases ***
Should Be Able to Complete a New Subscription
    
    ${data}    Get JSON fixture    memberships    create

    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account]

    SignIn Admin
    Go to memberShips
    Create new membership      ${data}
    Toast should be            Matrícula cadastrada com sucesso.

Duplicate Enrollment Must Be Avoided

    ${data}    Get JSON fixture    memberships    duplicate
    
    Insert Membership    ${data}

    SignIn Admin
    Go to memberShips
    Create new membership      ${data}
    Toast should be            O usuário já possui matrícula.
    
Must search by name

    ${data}    Get JSON fixture    memberships    search

    Insert Membership    ${data}

    SignIn Admin
    Go to memberships
    Search by name             ${data}[account][name]
    Should filter by name      ${data}[account][name]