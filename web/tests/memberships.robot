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
    
Must search a registration by name
    ${data}    Get JSON fixture    memberships    search

    Insert Membership    ${data}

    SignIn Admin
    Go to memberships page
    Search enrolment by name    ${data}[account][name]
    Should filter by name       ${data}[account][name]

Must delete a registration
    ${data}    Get JSON fixture    memberships    remove

    Insert Membership    ${data}

    SignIn Admin
    Go to memberShips page
    Request removal by name    ${data}[account][name]
    Confirm removal
    Toast should be    Matrícula removida com sucesso.
    Membership should not be visibled    ${data}[account][name]

Must update a registration
    ${data}        Get JSON fixture    memberships    update
    ${new_data}    Get JSON fixture    memberships    new_update
    Insert Membership    ${data}
    ${id}    Search Id By Cpf     ${data}[account][cpf]

    SignIn Admin
    Search client by name         ${data}[account][name]
    Go to membership edit form    ${id}
    Fill out the membership edit form    ${new_data}[account][name]    ${new_data}[account][email]    ${new_data}[account][cpf]
    Click submit button    button_name=Atualizar
    Toast should be        Dados atualizados com sucesso.
    Click the back button
    Search client by name            ${new_data}[account][name]
    Membership should be visibled    ${new_data}[account][name]
    
Should Not Allow Update With Empty Mandatory Fields
    ${data}        Get JSON fixture    memberships    update
    
    Insert Membership    ${data}
    ${id}    Search Id By Cpf     ${data}[account][cpf]
    SignIn Admin
    Search client by name         ${data}[account][name]
    Go to membership edit form    ${id}
    Fill out the membership edit form    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Click submit button    button_name=Atualizar
    Form should show required field errors
    ...    Nome é obrigatório
    ...    O email é obrigatório
    ...    O CPF é obrigatório

Submitting an empty form
    SignIn Admin
    Go to memberships page
    Go to memberships form
    Click submit button    button_name=Cadastrar
    Form should show required field errors
    ...    O usuário é obrigatório
    ...    O plano é obrigatório
    ...    O cartão de crédito é obrigatório
    ...    O nome do titular é obrigatório
    ...    O mês é obrigatório
    ...    O ano é obrigatório
    ...    O CVV é obrigatório