*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Scroll Until Element Is Visible
    [Arguments]    ${locator}
    Scroll Element Into View    ${locator}