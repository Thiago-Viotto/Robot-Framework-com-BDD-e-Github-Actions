*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    https://www.amazon.com.br
${BROWSER}    chrome
${EXECUTABLE_PATH}    C:\Program Files\chrome driver\chromedriver
${ELETRONICS_HEADER}    xpath://h1[contains(.,'Eletrônicos e Tecnologia')]
${ELETRONICS_MENU}    xpath://a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${LABEL_CART_ADDED}    xpath://span[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold'][contains(.,'Adicionado ao carrinho')]
${BUTTON_GO_CART}    xpath://a[contains(@data-csa-c-type,'button')]
${BUTTON_DELETE}    xpath://input[contains(@value,'Excluir')]
${LABEL_NONE_CART}    xpath://h1[@class='a-spacing-mini a-spacing-top-base'][contains(.,'Seu carrinho de compras da Amazon está vazio.')]

*** Keywords ***
Abre o browser
    Open Browser    url=${URL}    browser=${BROWSER}    executable_path=${EXECUTABLE_PATH}

que estou na home page da Amazon.com.br
    Go To    url=${URL}
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

adicionar o produto "${PRODUCT}" no carrinho
    Usuário digita o nome de produto "Xbox Series S" no campo de pesquisa
    Clicar no botão de pesquisa
    Wait Until Page Contains Element    locator=//img[contains(@alt,'${PRODUCT}')]
    Click Element    locator=//img[contains(@alt,'${PRODUCT}')]
    Wait Until Page Contains Element    locator=add-to-cart-button
    Click Element    locator=add-to-cart-button
    Wait Until Page Contains Element    locator=${LABEL_CART_ADDED}

o produto "${PRODUCT}" deve ser mostrado no carrinho
    Click Element    locator=${BUTTON_GO_CART}
    Wait Until Page Contains Element    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUCT}')]

existe o produto "${PRODUCT}" no carrinho
    adicionar o produto "Xbox Series S" no carrinho
    Click Element    locator=nav-cart-text-container
    Wait Until Page Contains Element    locator=//span[@class='a-truncate-cut'][contains(.,'${PRODUCT}')]

remover o produto "${PRODUCT}" do carrinho
    Wait Until Page Contains Element    locator=${BUTTON_DELETE}
    Click Element    locator=${BUTTON_DELETE}

o carrinho deve ficar vazio
    Wait Until Page Contains Element    locator=${LABEL_NONE_CART}
    
Fechar o navegador
    Close Browser    