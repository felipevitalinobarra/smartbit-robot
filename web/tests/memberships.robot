*** Settings ***
Documentation        Plan Adherence Test Suite

Resource        ../resources/Base.resource

Test Setup        Start Session
Test Teardown     Finish Session

*** Test Cases ***
Should be able to complete a new subscription
    ${data}    Get JSON fixture    memberships    create

    Insert Account             ${data}

    Initialize Membership Test
    Create new membership    ${data}
    Toast should be    Matrícula cadastrada com sucesso.

Duplicate enrollment must be avoided
    ${data}    Get JSON fixture    memberships    duplicate
    
    Insert Membership    ${data}

    Initialize Membership Test
    Create new membership    ${data}
    Toast should be    O usuário já possui matrícula.
    
Must search a registration by name
    ${data}    Get JSON fixture    memberships    search

    Insert Membership    ${data}

    Initialize Membership Test
    Search membership by name    ${data}[account][name]
    Should filter membership by name    ${data}[account][name]

Must delete a registration
    ${data}    Get JSON fixture    memberships    remove

    Insert Membership    ${data}

    Initialize Membership Test
    Request membership removal by name    ${data}[account][name]
    Confirm removal
    Toast should be    Matrícula removida com sucesso.
    Membership should not be visible    ${data}[account][name]

Submitting an empty form
    Initialize Membership Test
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