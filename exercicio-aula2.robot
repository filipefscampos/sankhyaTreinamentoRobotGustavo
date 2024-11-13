*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URBL_BASE}    http://localhost:8180/mge/
${NAVEGADOR}    Chrome
${DOM_USER}    document.querySelector("sankhya-login").shadowRoot.querySelector("input#user")
${DOM_PASS}    document.querySelector("sankhya-login").shadowRoot.querySelector("input#password")
${USER}    rh
${PASS}    123459
${BOTAO_PROSSEGUIR}    document.querySelector("sankhya-login").shadowRoot.querySelector("button.account-btn")
${PESQUISAR_HOME}    search-input-element
${TEMPO_ESPERA}    30s
${MSG_ERRO_CREDENCIAIS}    Usuário/Senha inválido.
${DOM_MSG_ERRO_CREDENCIAIS}    document.querySelector("sankhya-login").shadowRoot.querySelector(".ant-form-item-control-input-content p")


*** Test Cases ***
Realizar login inválido no sankhya localhost
    Dado que eu acesso o login do sankhya com sucesso
    Quando infomro o usuário no login
    E informo a senha
    Entao faco o login
    E valido as credenciais invalidas
    Fecho o navegador


*** Keywords ***
Dado que eu acesso o login do sankhya com sucesso
    Open Browser    ${URBL_BASE}    ${NAVEGADOR}
    Maximize Browser Window

Quando infomro o usuário no login
    Wait Until Element Is Visible    dom:${DOM_USER}
    Input Text    dom:${DOM_USER}    ${USER}
    Click Element    dom:${BOTAO_PROSSEGUIR}

E informo a senha
    Wait Until Element Is Visible    dom:${DOM_PASS}
    ## Wait Until Element Is Visible    dom:${BOTAO_PROSSEGUIR}
    Input Text    dom:${DOM_PASS}    ${PASS}

Entao faco o login
    ## Wait Until Element Is Visible    ${BOTAO_PROSSEGUIR}
    Click Element    dom:${BOTAO_PROSSEGUIR}
    ## Sleep    2s

E valido as credenciais invalidas
    Wait Until Element Contains    dom:${DOM_MSG_ERRO_CREDENCIAIS}    ${MSG_ERRO_CREDENCIAIS}
    Sleep    2s

Fecho o navegador
    Close Browser