*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br
${BROWSER}    chrome
${EXECUTABLE_PATH}    C:\Program Files\chrome driver\chromedriver
${ELETRONICS_HEADER}    xpath://h1[contains(.,'Eletrônicos e Tecnologia')]
${ELETRONICS_MENU}    xpath://a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]

*** Keywords ***
Acessar a home page do site Amazon.com.br
    Open Browser    url=${URL}    browser=${BROWSER}    executable_path=${EXECUTABLE_PATH}
    Maximize Browser Window
    Title Should Be    Amazon.com.br | Tudo pra você, de A a Z.
    Wait Until Page Contains Element    ${ELETRONICS_MENU}

Usuário entra no menu "Eletrônicos"
    Click Element    ${ELETRONICS_MENU}

Mensagem do título da página ser "${TITLE}"
    Title Should Be    ${TITLE}
    
Mensagem "Eletrônicos e Tecnologia" ser exibida
    Wait Until Element Is Visible    ${ELETRONICS_HEADER}

Mensagem de categoria ser "${COMPUTERS_CATEGORY}"
    Element Should Be Visible    //img[contains(@alt,'${COMPUTERS_CATEGORY}')]

Usuário digita o nome de produto "${PRODUCT}" no campo de pesquisa
    Input Text    locator=twotabsearchtextbox    text=${PRODUCT}

Clicar no botão de pesquisa
    Click Button    locator=nav-search-submit-button

Resultado da pesquisa ser exibido, listando o produto "${PRODUCT}"
    Wait Until Page Contains Element    locator=(//span[contains(.,'${PRODUCT}')])[2]

Fechar o navegador
    Capture Page Screenshot
    Close Browser    