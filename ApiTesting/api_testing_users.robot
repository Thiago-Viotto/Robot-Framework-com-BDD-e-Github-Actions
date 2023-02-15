*** Settings ***
Resource    resource_api_testing_users.robot

*** Test Cases ***
Scenario 01: Add a new user with successfull
    Given add a new user
    When add a created user in ServerRest    email=${EMAIL_TESTING}    expected_status_code=201
    Then check if user was registered with successfull  

Scenario 02: Add a already registered user
    Given add a new user
    When add a created user in ServerRest    email=${EMAIL_TESTING}    expected_status_code=201
    And add user again    
    Then check if user was not registered 
    
Scenario 03: Find a user with id
    Given add a new user
    When add a created user in ServerRest    email=${EMAIL_TESTING}    expected_status_code=201
    And query user data
    Then check returned data

Scenario 04: Login with new created user
    Given add a new user
    When add a created user in ServerRest    email=${EMAIL_TESTING}    expected_status_code=201
    And login with new user
    Then check if login was successfull

Scenario 05: Login with invalid user
    Given add a new user
    When add a created user in ServerRest    email=${EMAIL_TESTING}    expected_status_code=201
    And login with invalid user
    Then check if login was not successfull