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
    Go to memberShips page
    Create new membership      ${data}
    Toast should be            Matrícula cadastrada com sucesso.

Duplicate Enrollment Must Be Avoided

    ${data}    Get JSON fixture    memberships    duplicate
    
    Insert Membership    ${data}

    SignIn Admin
    Go to memberShips page
    Create new membership      ${data}
    Toast should be            O usuário já possui matrícula.
    
Must search by name

    ${data}    Get JSON fixture    memberships    search

    Insert Membership    ${data}

    SignIn Admin
    Go to memberships page
    Search by name             ${data}[account][name]
    Should filter by name      ${data}[account][name]

Must delete a registration

    ${data}    Get JSON fixture    memberships    remove

    Insert Membership    ${data}

    SignIn Admin
    Go to memberShips page
    Request removal by name    ${data}[account][name]
    Confirm removal
    Toast should be    Matrícula removida com sucesso.
    Membership should not be visibled    ${data}[account][name]

Submitting an empty form
    SignIn Admin
    Go to memberships page
    Go to memberships form
    Click submit button
    Form should show required field errors
    ...    O usuário é obrigatório
    ...    O plano é obrigatório
    ...    O cartão de crédito é obrigatório
    ...    O nome do titular é obrigatório
    ...    O mês é obrigatório
    ...    O ano é obrigatório
    ...    O CVV é obrigatório