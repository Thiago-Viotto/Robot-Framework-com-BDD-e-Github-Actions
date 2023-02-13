*** Settings ***
Library    SeleniumLibrary

*** Variables ***
@{numeros}    5    10    20    30    40    50    60    70    80

*** Test Cases ***
Caso de teste 1: Percorrer uma lista
    Given eu percorro uma lista

*** Keywords ***
eu percorro uma lista
    FOR    ${numero}    IN    @{numeros}
        IF  ${numero} == 5
            Log To Console     "Eu sou o número ${numero}!"
        ELSE IF    ${numero} == 10
            Log To Console    "Eu sou o número ${numero}!"
        ELSE
            Log To Console    "Eu não sou o número 5 e nem o 10!"
        END        
    END