*** Settings ***
Documentation        Landing Page Actions and Elements

Library    Browser

*** Keywords ***

Submit signup form
    [Arguments]    ${account}

    Get Text    css=#signup h2
    ...         equal
    ...         Faça seu cadastro e venha para a Smartbit!

    Fill Text      id=name        ${account}[name]
    Fill Text      id=email       ${account}[email]
    Fill Text      id=cpf         ${account}[cpf]

    Click          css=button >> text=Cadastrar

Check slogan on Landing Page
    ${element}     Set Variable    .headline h2

    Wait For Elements State    ${element}    visible    5
    Get Text    ${element}    equal    Sua Jornada Fitness Começa aqui!