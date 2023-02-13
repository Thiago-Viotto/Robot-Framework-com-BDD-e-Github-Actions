*** Settings ***
Library    RequestsLibrary
Library    String



*** Keywords ***
add a new user
    ${random_word}    Generate Random String    length=4    chars=[LETTERS]
    ${random_word}    Convert To Lower Case    ${random_word}
    ${EMAIL_TESTING}=    Set Variable    ${random_word}@emailteste.com
    Log    ${EMAIL_TESTING}