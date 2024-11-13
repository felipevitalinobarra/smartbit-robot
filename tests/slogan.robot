*** Settings ***
Documentation        Test to verify Smart Bit's slogan on the WebApp

Resource    ../resources/base.resource

*** Test Cases ***
Should display the Slogan on the Landing Page
    Start Session
    Finish Session