*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://robotizandotestes.blogspot.com
${BROWSER}    chrome
${EXECUTABLE_PATH}    ..\..\chromedriver
${BTN_PESQUISAR}    class:search-expand
${INPUT_PESQUISAR}    name=q
${BTN_PESQUISAR_INPUT}    css=input.search-action.flat-button
${CONTEÚDO_POST}    xpath=//*[contains(text(),'O que é Robot Framework?')]
${POST}    css=h3.post-title.entry-title
${POSTAR_COMENTÁRIO}    xpath=//*[contains(text(),'Postar um comentário')]
${SEÇÃO_COMENTÁRIO}    textArea.KHxj8b
${MENU}    css=button.svg-icon-24-button.hamburger-menu
${CLAUBER_LIMA}    xpath=//*[contains(text(),'Clauber Lima')]

*** Keywords ***
Acessar a página do blog
    Open Browser    url=${URL}    browser=${BROWSER}    executable_path=${EXECUTABLE_PATH}
    Title Should Be    Robotizando Testes

Usuário quer pesquisar por um post "${TEXTO_PESQUISA}"
    Wait Until Element Is Visible    locator=${BTN_PESQUISAR}
    Click Button    ${BTN_PESQUISAR}
    Input Text    ${INPUT_PESQUISAR}    ${TEXTO_PESQUISA}
    Wait Until Element Is Visible    locator=${BTN_PESQUISAR_INPUT}
    Click Element    ${BTN_PESQUISAR_INPUT}

Mensagem exibida deve ser "${MENSAGEM_EXIBIDA}"
    Page Should Contain    ${MENSAGEM_EXIBIDA}

Acessar o post
    Click Element    ${POST}

Clicar em Postar um comentário
    Click Element    ${POSTAR_COMENTÁRIO}

Mensagem de login do google deve ser "${AVISO_GOOGLE}"
    Page Should Contain    ${AVISO_GOOGLE}    

Usuário quer acessar menu
    Click Element    ${MENU}
    Page Should Contain Element    ${CLAUBER_LIMA}
    
Clicar em um autor
    Wait Until Element Is Visible    locator=${CLAUBER_LIMA}
    Click Element    ${CLAUBER_LIMA}

Fechar o navegador
    Close Browser    