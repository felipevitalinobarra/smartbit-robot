*** Settings ***
Documentation        Customer pre-registration test scenarios

Resource    ../resources/base.resource

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
Should start customer registration

    ${account}    Get Fake Account

    Submit signup form    ${account}
    Verify welcome message

Incomplete registration attempt
    [Template]      Attempt signup
    ${EMPTY}        felipe@gmail.com    67752995088    Por favor informe o seu nome completo
    Felipe Barra    ${EMPTY}            67752995088    Por favor, informe o seu melhor e-mail
    Felipe Barra    felipe@gmail.com    ${EMPTY}       Por favor, informe o seu CPF    

Email in invalid format
    [Tags]    inv_email

    FOR    ${email}    IN    @{invalid_emails}
           ${account}    Create Dictionary
           ...    name=Felipe Barra
           ...    email=${email}
           ...    cpf=67752995088

           Submit signup form    ${account}
           Notice should be    Oops! O email informado é inválido
    END

CPF in invalid format
    [Tags]    inv_cpf

    FOR    ${cpf}    IN    @{invalid_cpfs}
           ${account}    Create Dictionary
           ...    name=Felipe Barra
           ...    email=felipe@gmail.com
           ...    cpf=${cpf}

           Submit signup form    ${account}
           Notice should be    Oops! O CPF informado é inválido
    END

*** Keywords ***

Attempt signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}

    ${account}    Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}

    Submit signup form    ${account}
    Notice should be      ${output_message}