*** Settings ***
Documentation        Customer Account Testing Scenarios

Resource        ../resources/Base.resource

Test Setup        Start Session
Test Teardown     Finish Session

*** Test Cases ***
Must update a registration
    ${data}        Get JSON fixture    accounts    update
    ${new_data}    Get JSON fixture    accounts    new_update
    Insert Account    ${data}

    SignIn admin
    Search account by name       ${data}[account][name]
    ${id}    Search id by cpf    ${data}[account][cpf]
    Go to account edit form      ${id}
    Fill out the account edit form    ${new_data}[account][name]    ${new_data}[account][email]    ${new_data}[account][cpf]
    Click the update button
    Toast should be        Dados atualizados com sucesso.
    Click the back button
    Search account by name            ${new_data}[account][name]
    Account should be visible    ${new_data}[account][name]
    Search account by name    ${data}[account][name]
    Account should not be visible    ${data}[account][name]
    
Should Not Allow Update With Empty Mandatory Fields
    [Tags]    smoke
    ${data}    Get JSON fixture     accounts    update
    Insert account    ${data}
    
    SignIn admin
    Search account by name        ${data}[account][name]
    ${id}    Search id by cpf     ${data}[account][cpf]
    Go to account edit form       ${id}
    Fill out the account edit form    ${EMPTY}    ${EMPTY}    ${EMPTY} 
    Click the update button
    Form should show required field errors
    ...    Nome é obrigatório
    ...    O email é obrigatório
    ...    O CPF é obrigatório