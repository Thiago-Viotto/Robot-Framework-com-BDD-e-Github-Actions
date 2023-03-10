*** Settings ***
Documentation    Essa suite testa o site da Amazon
Resource    resourceAmazon.robot
Test Setup    Abre o browser
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de teste 1: Acesso ao menu "Eletrônicos"
    [Documentation]    Acessa o site da Amazon e clica no menu de 'Eletrônicos'
    [Tags]             menu
    Given que estou na home page da Amazon.com.br
    When Usuário entra no menu "Eletrônicos"
    Then Mensagem "Eletrônicos e Tecnologia" ser exibida
    Then Mensagem do título da página ser     Eletrônicos e Tecnologia | Amazon.com.br
    Then Mensagem de categoria ser    Computadores e Informática
    Then Mensagem de categoria ser    Tablets

Caso de teste 2: Pesquisa de um produto
    [Documentation]    Acessa o site da Amazon e pesquisa por um produto
    [Tags]             busca_produtos
    Given que estou na home page da Amazon.com.br
    And Usuário digita o nome de produto "Xbox Series S" no campo de pesquisa
    When Clicar no botão de pesquisa
    Then Resultado da pesquisa ser exibido, listando o produto    Console Xbox Series S 

Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras 
    [Tags]             adicionar_carrinho     
    Given que estou na home page da Amazon.com.br
    When adicionar o produto "Xbox Series S" no carrinho
    Then o produto "Console Xbox Series S" deve ser mostrado no carrinho

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras 
    [Tags]             remover_carrinho 
    Given que estou na home page da Amazon.com.br
    And existe o produto "Console Xbox Series S" no carrinho
    When remover o produto "Console Xbox Series S" do carrinho
    Then o carrinho deve ficar vazio

Caso de Teste 05 - Acessar ofertas do dia
    [Documentation]    Esse teste verifica a tela de ofertas do dia
    [Tags]             ofertas_dia
    Given que estou na home page da Amazon.com.br
    When clicar em    Ofertas do Dia
    Then o texto de 'Ofertas e Promoções' deverá ser exibido

Caso de Teste 06 - Acessar mais vendidos
    [Documentation]    Esse teste verifica a tela de mais vendidos
    [Tags]             mais_vendidos 
    Given que estou na home page da Amazon.com.br
    When clicar em     Mais Vendidos
    Then o texto de 'Mais vendidos' deverá ser exibido

Caso de Teste 07 - Acessar seção de comentários de um produto
    [Documentation]    Esse teste verifica a seção de comentários de um produto
    [Tags]             comentários
    Given que estou na home page da Amazon.com.br
    And Usuário digita o nome de produto "NINHO Fases 1+ 800g" no campo de pesquisa
    When Clicar no botão de pesquisa
    Then Resultado da pesquisa ser exibido, listando o produto    NINHO Fases 1+ 800g
    When Clicar no produto    NINHO Fases 1+ 800g
    Then Tela do produto "NINHO Fases 1+ 800g" deverá ser exibida
    And Seção de comentários deverá ser exibida no final da tela

Caso de Teste 08 - Acessar tela de login ao tentar adicionar á lista deslogado
    [Documentation]    Esse teste verifica se a tela de login aparece após usuário tentar adicionar produto a lista deslogado
    [Tags]             adicionar_lista
    Given que estou na home page da Amazon.com.br
    And Usuário digita o nome de produto "JBL, Fone de Ouvido Bluetooth, Tune 510BT - Azul" no campo de pesquisa
    When Clicar no botão de pesquisa
    Then Resultado da pesquisa ser exibido, listando o produto    JBL, Fone de Ouvido Bluetooth, Tune 510BT - Azul
    When Clicar no produto    JBL, Fone de Ouvido Bluetooth, Tune 510BT - Azul
    Then Tela do produto "JBL, Fone de Ouvido Bluetooth, Tune 510BT - Azul" deverá ser exibida
    When Clicar em adicionar á lista
    Then Tela de login ser exibida