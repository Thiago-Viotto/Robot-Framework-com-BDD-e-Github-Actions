*** Settings ***
Resource    resource_api_testing_users.robot

*** Variables ***


*** Test Cases ***
Scenario 01: Add a new user with successfull
    Given add a new user
    When add a created user in ServerRest    email=${EMAIL_TESTING}    expected_status_code=200
    Then check if user was registered with successfull  

Scenario 02: Add a already registered user
    Given add a new user
    When add a created user in ServerRest    email=${EMAIL_TESTING}    expected_status_code=201
    And add user again    
    Then check if user was not registered 
    