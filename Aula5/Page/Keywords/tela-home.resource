*** Settings ***
Library    SeleniumLibrary
Resource    ../Objects/tela-home.resource
Resource    ../../Data/tela-login.resource


*** Keywords ***
Valido que estou no home do sankhya
    Wait Until Element Is Visible    id:${PESQUISAR_HOME}    ${TEMPO_ESPERA}