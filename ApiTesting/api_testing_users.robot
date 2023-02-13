*** Settings ***
Resource    resource_api_testing_users.robot

*** Variables ***


*** Test Cases ***
Scenario 01: Add a new user with successfull
    Given add a new user
  #  When add a created user in ServerRest
  #  Then check if user was registered with successfull  
    