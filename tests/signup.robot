*** Settings ***
Documentation        Customer pre-registration test scenarios

Resource    ../resources/base.resource

*** Test Cases ***
Should start customer registration

    ${account}    Get Fake Account

    Start Session

    Fill Text      id=name        ${account}[name]
    Fill Text      id=email       ${account}[email]
    Fill Text      id=document    ${account}[document]

    Click          css=button >> text=Cadastrar

    Wait For Elements State    text=Falta pouco para fazer parte da família Smartbit!
    ...    visible    5

    Finish Session

Name field must be required
    [Tags]    required

    Start Session

    Fill Text      id=email       felipe@gmail.com
    Fill Text      id=document    67752995088

    Click          css=button >> text=Cadastrar

    Wait For Elements State    css=form .notice    visible    5
    Get Text    css=form .notice    equal    Por favor informe o seu nome completo

    Finish Session

Email field must be required
    [Tags]    required

    Start Session

    Fill Text      id=name        Felipe Barra
    Fill Text      id=document    67752995088

    Click          css=button >> text=Cadastrar

    Wait For Elements State    css=form .notice    visible    5
    Get Text    css=form .notice    equal    Por favor, informe o seu melhor e-mail

    Finish Session

CPF field must be required
    [Tags]    required

    Start Session

    Fill Text      id=name        Felipe Barra
    Fill Text      id=email       felipe@gmail.com

    Click          css=button >> text=Cadastrar

    Wait For Elements State    css=form .notice    visible    5
    Get Text    css=form .notice    equal    Por favor, informe o seu CPF

    Finish Session       