*** Settings ***
Documentation    Arquivo de variáveis

Resource    Base.resource

*** Variables ***
${BROWSER}    chromium
${HEADLESS}   False 
${URL}        http://localhost:3000

@{invalid_emails}  emailgmail.com    email@@gmail.com    email@.com      email@gmailcom    
    ...            email@gmail.      email()@gmail.com   email@domain$%.com    
    ...            email@ gmail.com  email@

@{invalid_cpfs}    000.000.000-00    111.111.111-11    222.222.222-22    123.456.789-00
    ...            999.999.999-99    123.abc.789-00    cpf.test.abc-00   ABC.DEF.GHI-JK
    ...            123.456.789-*0    @@@.###.$$$-%%    123.456.78@-00    123.456.78-00
    ...            12.345.678-90     123.4567.890-00   123456789         123/456/789-00
    ...            123-456-789-00    123.456.789.00    CPF-123-456-789