*** Settings ***
Documentation        Login test suite

Resource    resources/Base.Resource

Test Setup        Start Session
Test Teardown     Finish Session

*** Test Cases ***

Must log in with document and IP Adress
    Signin with document    10953144089
    User is logged in