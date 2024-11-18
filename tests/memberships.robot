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

    Go to Login Page
    Submit Login Form    sac@smartbit.com    pwd123
    User is logged in    sac@smartbit.com

    Go to memberShips
    Go to memberShips form
    Select account        ${data}[account][name]    ${data}[account][cpf]
    Select plan           ${data}[plan]
    Fill payment card     ${data}[credit_card]

    Click                 css=button[type=submit] >> text=Cadastrar
    Toast should be       Matrícula cadastrada com sucesso.

*** Keywords ***
Go to memberships
    Click    css=a[href="/memberships"]
    
    Wait For Elements State    css=h1 >> text=Matrículas    
    ...    visible    5

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