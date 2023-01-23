*** Settings ***
Resource    resource.robot
Test Setup    Acessar a página do blog
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de teste 1: Pesquisar um post
    Given Usuário quer pesquisar por um post "Season Premiere: Introdução ao Robot Framework"
    Then Mensagem exibida deve ser "Season Premiere: Introdução ao Robot Framework"

Caso de teste 2: Ler um post
    Given Usuário quer pesquisar por um post "Season Premiere: Introdução ao Robot Framework"
    When Acessar o post
    Then Mensagem exibida deve ser "O que é Robot Framework?"

Caso de teste 3: Acessar seção de comentários
    Given Usuário quer pesquisar por um post "Season Premiere: Introdução ao Robot Framework"
    When Clicar em Postar um comentário
    Then Mensagem de login do google deve ser "Para deixar um comentário, clique no botão abaixo e faça login com o Google."

Caso de teste 4: Acessar autores
    Given Usuário quer acessar menu
    When Clicar em um autor
    Then Mensagem exibida deve ser "Robotizando Testes"