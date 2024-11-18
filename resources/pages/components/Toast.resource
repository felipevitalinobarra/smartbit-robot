*** Settings ***
Documentation        Toast Components Actions and Elements

Library    Browser

*** Keywords ***
Toast should be
    [Arguments]     ${expected_text}

    ${selector}    Set Variable    .Toastify__toast-body

    Wait For Elements State    css=${selector}     visible    5
    Get Text    css=${selector}     equal    ${expected_text}

    Take Screenshot    selector=${selector} 