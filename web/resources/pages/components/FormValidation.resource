*** Settings ***
Documentation    Keywords to validate error messages in forms

Library    Browser

*** Keywords ***

Form should show required field errors
    [Arguments]    @{expected_errors}
    
    FOR    ${error}    IN    @{expected_errors}
        Wait For Elements State    css=span >> text="${error}"    visible    5
    END