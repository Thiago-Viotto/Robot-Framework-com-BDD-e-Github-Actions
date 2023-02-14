*** Settings ***
Library    RequestsLibrary
Library    String
Library    Collections

*** Variables ***
${API_URL}    https://serverest.dev
${HEADERS}    {'Content-Type': 'application/json'}

*** Keywords ***
add a new user
    ${random_word}    Generate Random String    length=4    chars=[LETTERS]
    ${random_word}    Convert To Lower Case    ${random_word}
    Set Global Variable    ${EMAIL_TESTING}    ${random_word}@emailteste.com
    Log    ${EMAIL_TESTING}

add a created user in ServerRest
    [Arguments]    ${email}    ${expected_status_code}
    ${body}    Create Dictionary
    ...        nome=Fulano da Silva
    ...        email=${email}
    ...        password=teste
    ...        administrador=true
    create session in ServerRest
    ${response}    POST On Session    alias=add_user_session    url=/usuarios    json=${body}    expected_status=${expected_status_code}
    Set Test Variable    ${RESPONSE}    ${response.json()}

check if user was registered with successfull
    Log    ${RESPONSE}
    Dictionary Should Contain Item    ${RESPONSE}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key    ${RESPONSE}    _id

add user again
    add a created user in ServerRest    email=EMAIL_TESTING    expected_status_code=400

check if user was not registered
    Log    ${RESPONSE}
    Dictionary Should Contain Item    ${RESPONSE}    email    email deve ser um email válido
    Dictionary Should Not Contain Key    ${RESPONSE}    _id

create session in ServerRest
    ${headers}    Create Dictionary
    ...        accept=application/json
    ...        Content-Type=application/json
    Create Session    alias=add_user_session    url=${API_URL}    headers=${headers}
