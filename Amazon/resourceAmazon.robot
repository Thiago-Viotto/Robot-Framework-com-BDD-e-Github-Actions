*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br
${BROWSER}    chrome
${EXECUTABLE_PATH}    C:\Program Files\chrome driver\chromedriver
${ELETRONICS_MENU}    xpath://a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${COMPUTERS_CATEGORY}    xpath://img[contains(@alt,'Computadores e Informática')]
${SEARCH_INPUT}    xpath://input[contains(@type,'text')]
${SEARCH_BUTTON}    xpath://input[contains(@type,'submit')]
${PRODUCT}    xpath://span[@class='a-size-base-plus a-color-base a-text-normal'][contains(.,'Xbox Series S - Pacote Fortnite, Rocket League e Fall Guys')]

*** Keywords ***
Acessar a home page do site Amazon.com.br
    Open Browser    url=${URL}    browser=${BROWSER}    executable_path=${EXECUTABLE_PATH}
    Maximize Browser Window
    Title Should Be    Amazon.com.br | Tudo pra você, de A a Z.
    Wait Until Page Contains Element    ${ELETRONICS_MENU}

Usuário entra no menu "Eletrônicos"
    Click Element    ${ELETRONICS_MENU}

Mensagem do título da página ser "Eletrônicos e Tecnologia | Amazon.com.br"
    Title Should Be    Eletrônicos e Tecnologia | Amazon.com.br
    
Mensagem "${MENSAGEM_EXIBIDA}" ser exibida
    Page Should Contain    ${MENSAGEM_EXIBIDA}

Mensagem de categoria ser "Computadores e Informática"
    Wait Until Page Contains Element    ${COMPUTERS_CATEGORY}

Usuário digita o nome de produto "Xbox Series S" no campo de pesquisa
    Input Text    ${SEARCH_INPUT}    Xbox Series S

Clicar no botão de pesquisa
    Click Button    ${SEARCH_BUTTON}

Resultado da pesquisa ser exibido, listando o produto pesquisado
    Wait Until Page Contains Element    ${PRODUCT}

Fechar o navegador
    Close Browser    