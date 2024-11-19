*** Settings ***
Documentation        Test to verify Smart Bit's slogan on the WebApp

Resource    ../resources/base.resource

Test Setup       Start Session
Test Teardown    Finish Session

*** Test Cases ***
Should display the Slogan on the Landing Page
    Check slogan on Landing Page