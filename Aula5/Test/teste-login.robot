*** Settings ***
Library    SeleniumLibrary
Resource    ../Page/Keywords/tela-login.resource
Resource    ../Page/Keywords/tela-home.resource
Test Setup    Dado que eu acesso o login do sankhya com sucesso
Test Teardown    Fecho o navegador


*** Test Cases ***
Realizar login no sankhya com usuário válido
    [Tags]    Login sankhya
    Quando informo o usuário no login    USER_ARG=rh
    E informo a senha    PASS_ARG=123456
    Entao faco o login
    Valido que estou no home do sankhya