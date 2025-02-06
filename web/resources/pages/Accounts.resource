*** Settings ***
Documentation        Account Page Actions and Elements

Library    Browser

*** Keywords ***
Search account by name
    [Arguments]    ${name}

    Fill Text    css=input[placeholder^=Buscar]    ${name}
    Wait For Elements State    css=strong >> text=Total: 1
    ...    visible    5

Should filter account by name
    [Arguments]    ${name}
    
    Wait For Elements State    css=table tbody tr >> text=${name}
    ...    visible    5

Request account removal by name
    [Arguments]    ${name}

    Click    xpath=//td[text()="${name}"]/..//button

Account should not be visible
    [Arguments]    ${name}

    Wait For Elements State    css=table tbody tr >> text="${name}"
    ...    detached    5

Account should be visible
    [Arguments]    ${name}

    Wait For Elements State    css=table tbody tr >> text="${name}"
    ...    visible    5     

Go to account edit form
    [Arguments]    ${id}

    Click    css=a[href="/accounts/${id}/edit"]
    Wait For Elements State    css=h1 >> text=Editar
    ...    visible    5

Fill out the account edit form
    [Arguments]    ${name}    ${email}    ${cpf}
    Fill Text    css=input[name='name']     ${name}
    Fill Text    css=input[name='email']    ${email}
    Fill Text    css=input[name='cpf']    ${cpf}

Click the update button
    Click    css=button[type=submit] >> text=Atualizar