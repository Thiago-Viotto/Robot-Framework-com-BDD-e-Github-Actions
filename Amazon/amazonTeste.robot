*** Settings ***
Documentation    Essa suite testa o site da Amazon
Resource    resourceAmazon.robot
Test Setup    Acessar a home page do site Amazon.com.br
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de teste 1: Acesso ao menu "Eletrônicos"
    [Documentation]    Acessa o site da Amazon e clica no menu de 'Eletrônicos'
    [Tags]             menu
    Given Usuário entra no menu "Eletrônicos"
    Then Mensagem "Eletrônicos e Tecnologia" ser exibida
    And Mensagem do título da página ser "Eletrônicos e Tecnologia | Amazon.com.br"
    And Mensagem de categoria ser "Computadores e Informática"
    And Mensagem de categoria ser "Tablets"

Caso de teste 2: Pesquisa de um produto
    [Documentation]    Acessa o site da Amazon e pesquisa por um produto
    [Tags]             busca_produtos
    Given Usuário digita o nome de produto "Xbox Series S" no campo de pesquisa
    When Clicar no botão de pesquisa
    Then Resultado da pesquisa ser exibido, listando o produto "Console Xbox Series S" 

