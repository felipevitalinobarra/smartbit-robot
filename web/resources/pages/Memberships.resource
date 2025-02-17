*** Settings ***
Documentation        Actions and elements of the registration page

Library    Browser

*** Keywords ***

Create new membership
    [Arguments]    ${data}

    Go to memberShips form
    Select account        ${data}[account][name]    ${data}[account][cpf]
    Select plan           ${data}[plan][name]
    Fill payment card     ${data}[credit_card]
    Click                 css=button[type=submit] >> text=Cadastrar

Go to memberships form
    Click    css=a[href="/memberships/new"]
    Wait For Elements State    css=h1 >> text=Nova Matrícula    
    ...    visible    5

Select account
    [Arguments]    ${name}    ${cpf}

    Fill Text    css=input[aria-label=select_account]    ${name}
    Click        css=[data-testid="${cpf}"]

Select plan
    [Arguments]    ${plan}

    Fill Text    css=input[aria-label=select_plan]    ${plan}
    Click        css=div[class$=option] >> text=${plan}

Fill payment card
    [Arguments]    ${card}

    Fill Text    css=input[name="card_number"]     ${card}[number]
    Fill Text    css=input[name="card_holder"]     ${card}[holder]
    Fill Text    css=input[name="card_month"]      ${card}[month]
    Fill Text    css=input[name="card_year"]       ${card}[year]
    Fill Text    css=input[name="card_cvv"]        ${card}[cvv]

Click submit button
    Click    css=button[type=submit] >> text=Cadastrar

Click the back button
    Click    css=span >> text=Voltar
    Wait For Elements State    css=h1 >> text=Clientes
    ...    visible    5

Search membership by name
    [Arguments]    ${name}

    Fill Text    css=input[placeholder^=Busque]    ${name}
    Wait For Elements State    css=strong >> text=Total: 1
    ...    visible    5
  
Should filter membership by name
    [Arguments]    ${name}
    
    Wait For Elements State    css=table tbody tr >> text=${name}
    ...    visible    5

Request membership removal by name
    [Arguments]    ${name}

    Click    xpath=//td[text()="${name}"]/..//button

Membership should not be visible
    [Arguments]    ${name}

    Wait For Elements State    css=table tbody tr >> text="${name}"
    ...    detached    5

Membership should be visible
    [Arguments]    ${name}

    Wait For Elements State    css=table tbody tr >> text="${name}"
    ...    visible    5