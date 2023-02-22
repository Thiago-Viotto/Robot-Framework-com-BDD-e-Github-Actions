# Robot Framework com BDD e Github Actions
 
Projeto pessoal aplicando o Robot Framework com Selenium e BDD, testes de API com a Requests Library e integração contínua com Github Actions

Integração contínua com Github Actions
![6381daaa-bbe8-4212-bc4e-40f32126bcdb](https://user-images.githubusercontent.com/30843151/220720694-dcd4ce7f-ea2b-49aa-a078-c8ac5133e828.gif)

Site da Amazon
![b2b0fc66-ad52-4fa9-aeed-13ec3e87a94e](https://user-images.githubusercontent.com/30843151/215855049-b043dbb0-e993-43cb-a66a-0f5ee73a163e.gif)

Site de testes do Robot
![168a8b03-6df1-440e-ae5f-d10bc86be730](https://user-images.githubusercontent.com/30843151/214155124-adb2976f-f837-4c91-8e80-a1f82524e7fe.gif)

Testes de API
![apiTesting](https://user-images.githubusercontent.com/30843151/219058486-a6616cb1-b601-4b38-974d-e607f56006ec.png)

## Setup
- `git clone git@github.com:Thiago-Viotto/Projeto-Pessoal-Robot-Framework.git`
- Instalar o ChromeDriver da mesma versão do seu Chrome https://chromedriver.chromium.org/downloads
- No arquivo de resource, alterar a varíavel EXECUTABLE_PATH para o caminho do seu ChromeDriver
- Instalar o python https://www.python.org/downloads/
- `python -m pip install --upgrade pip`
- `pip install robotframework`
- `pip install robotframework-seleniumlibrary`
- `pip install robotframework-requests`

## Execução
- `robot --variable BROWSER:chrome tests/ci_tests`

## Contato
- Email: thiagohenriqueviotto1@gmail.com
- Linkedin: https://www.linkedin.com/in/thiago-henrique-viotto-4485b5147/
