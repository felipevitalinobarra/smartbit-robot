*** Settings ***
Documentation        Customer pre-registration test scenarios

Resource    ../resources/base.resource

Test Setup       Start Session
Test Teardown    Finish Session

*** Variables ***
@{invalid_cpfs}    000.000.000-00    111.111.111-11    222.222.222-22    123.456.789-00
    ...            999.999.999-99    123.abc.789-00    cpf.test.abc-00   ABC.DEF.GHI-JK
    ...            123.456.789-*0    @@@.###.$$$-%%    123.456.78@-00    123.456.78-00
    ...            12.345.678-90     123.4567.890-00   123456789         123/456/789-00
    ...            123-456-789-00    123.456.789.00    CPF-123-456-789

@{invalid_emails}  emailgmail.com    email@@gmail.com    email@.com      email@gmailcom    
    ...            email@gmail.      email()@gmail.com   email@domain$%.com    
    ...            email@ gmail.com  email@

*** Test Cases ***
Should start customer registration

    ${account}    Get Fake Account

    Submit signup form    ${account}

    Wait For Elements State    text=Falta pouco para fazer parte da família Smartbit!
    ...    visible    5

Name field must be required
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=${EMPTY}
    ...    email=felipe@gmail.com
    ...    cpf=67752995088

    Submit signup form    ${account}

    Notice should be    Por favor informe o seu nome completo

Email field must be required
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=Felipe Barra
    ...    email=${EMPTY}
    ...    cpf=67752995088

    Submit signup form    ${account}

    Notice should be    Por favor, informe o seu melhor e-mail

CPF field must be required
    [Tags]    required

    ${account}    Create Dictionary
    ...    name=Felipe Barra
    ...    email=felipe@gmail.com
    ...    cpf=${EMPTY}

    Submit signup form    ${account}

    Notice should be    Por favor, informe o seu CPF

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