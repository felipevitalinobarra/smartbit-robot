*** Settings ***
Documentation        Customer pre-registration test scenarios

Resource         ../resources/base.resource

Test Setup       Start Session
Test Teardown    Finish Session

*** Variables ***

@{invalid_emails}  emailgmail.com    email@@gmail.com    email@.com      email@gmailcom    
    ...            email@gmail.      email()@gmail.com   email@domain$%.com    
    ...            email@ gmail.com  email@              www.teste.com.br

@{invalid_cpfs}    000.000.000-00    111.111.111-11    222.222.222-22    123.456.789-00
    ...            999.999.999-99    123.abc.789-00    cpf.test.abc-00   ABC.DEF.GHI-JK
    ...            123.456.789-*0    @@@.###.$$$-%%    123.456.78@-00    123.456.78-00
    ...            12.345.678-90     123.4567.890-00   123456789         123/456/789-00
    ...            123-456-789-00    123.456.789.00    CPF-123-456-789

*** Test Cases ***
Must register customer registration successfully
    [Tags]    smoke

    ${account}    Create Dictionary
    ...    name=Felipe Barra
    ...    email=felipe@smartbit.com
    ...    cpf=92195361026

    Delete Account By Email    ${account}[email]
    Submit signup form         ${account}
    Verify welcome message

Incomplete registration attempt
    [Template]      Attempt signup
    ${EMPTY}        felipe@gmail.com    67752995088    Por favor informe o seu nome completo
    Felipe Barra    ${EMPTY}            67752995088    Por favor, informe o seu melhor e-mail
    Felipe Barra    felipe@gmail.com    ${EMPTY}       Por favor, informe o seu CPF    

Duplicate email attempt
    ${data}    Get JSON fixture    signup    dup_email

    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account]
    Submit signup form         ${data}[account]
    Toast should be            O e-mail fornecido já foi cadastrado!

Duplicate cpf attempt
    ${data}    Get JSON fixture    signup    dup_cpf
   
    Delete Account By Email    ${data}[account][email]
    Insert Account             ${data}[account]

    Set To Dictionary          ${data}[account]    email    another_email@example.com
    Submit signup form         ${data}[account]
    Toast should be            O CPF fornecido já foi cadastrado!

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