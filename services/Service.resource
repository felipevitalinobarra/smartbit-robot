*** Settings ***
Documentation        API Integration Layer

Library    RequestsLibrary

*** Variables ***
${BASE_URL}    http://localhost:3333

*** Keywords ***
Set user token
    ${payload}    Create Dictionary
    ...           email=sac@smartbit.com
    ...           password=pwd123

    ${resp}    POST
    ...    ${BASE_URL}/sessions
    ...    json=${payload}

    ${token}    Set Variable    Bearer ${resp.json()}[token]
    
    Set Suite Variable    ${token}

Get account by name
    [Arguments]    ${name}

    ${headers}    Create Dictionary
    ...    Authorization=${token}
    
    ${params}    Create Dictionary
    ...    name=${name}

    ${resp}    GET    
    ...    url=${BASE_URL}/accounts
    ...    params=${params}
    ...    headers=${headers}

    [RETURN]    ${resp.json()}[data][0]