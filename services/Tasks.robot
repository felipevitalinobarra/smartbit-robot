*** Settings ***
Documentation        File to test API consumption with tasks

Resource    ./Service.resource

*** Tasks ***
Testando a API
    Set user token
    Get account by name    Ramon Dino