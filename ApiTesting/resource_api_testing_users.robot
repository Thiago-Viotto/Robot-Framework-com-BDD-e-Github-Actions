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
    ${response}    POST On Session    alias=add_session    url=/usuarios    json=${body}    expected_status=${expected_status_code}

    IF  ${response.status_code} == 201
        Set Test Variable    ${USER_ID}    ${response.json()["_id"]}
    END
    
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
    Create Session    alias=add_session    url=${API_URL}    headers=${headers}

query user data
    ${response_query}    GET On Session    alias=add_session    url=/usuarios/${USER_ID}
    Set Test Variable    ${RESP_QUERY}    ${response_query.json()}

check returned data
    Log    ${RESP_QUERY}
    Dictionary Should Contain Item    ${RESP_QUERY}    nome             Fulano da Silva
    Dictionary Should Contain Item    ${RESP_QUERY}    email            ${EMAIL_TESTING}
    Dictionary Should Contain Item    ${RESP_QUERY}    password         teste
    Dictionary Should Contain Item    ${RESP_QUERY}    administrador    true
    Dictionary Should Contain Item    ${RESP_QUERY}    _id              ${USER_ID}

login with new user
    query user data
    ${body}    Create Dictionary
    ...        email=${RESP_QUERY["email"]}
    ...        password=${RESP_QUERY["password"]}
    create session in ServerRest
    ${response}    POST On Session    alias=add_session    url=/login    json=${body}
    Set Test Variable    ${RESPONSE}    ${response.json()}

check if login was successfull
    Log    ${RESPONSE}
    Dictionary Should Contain Item    ${RESPONSE}    message    Login realizado com sucesso
