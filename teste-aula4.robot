*** Settings ***
Library    SeleniumLibrary
Test Setup    Dado que eu acesso o login do sankhya com sucesso
Test Teardown    Fecho o navegador


*** Variables ***
${URBL_BASE}    http://localhost:8180/mge/
${NAVEGADOR}    Chrome
${DOM_USER}    document.querySelector("sankhya-login").shadowRoot.querySelector("input#user")
${DOM_PASS}    document.querySelector("sankhya-login").shadowRoot.querySelector("input#password")
${USER}    rh
${PASS}    123456
${BOTAO_PROSSEGUIR}    document.querySelector("sankhya-login").shadowRoot.querySelector("button.account-btn")
${PESQUISAR_HOME}    search-input-element
${TEMPO_ESPERA}    30s
${INDEX}    1


*** Test Cases ***
Realizar login no sankhya com usuário válido
    [Tags]    Login sankhya
    #Dado que eu acesso o login do sankhya com sucesso
    Quando informo o usuário no login    USER_ARG=rh
    E informo a senha    PASS_ARG=123456
    #Entao faco o login


*** Keywords ***
Dado que eu acesso o login do sankhya com sucesso
    Open Browser    ${URBL_BASE}    ${NAVEGADOR}
    Maximize Browser Window

    # IF  '${USER}' == 'r41541851'
    #     Log To Console    Este e o usuario RH
    # ELSE
    #     Log To Console    Nao e o user RH
    # END
    

    # FOR  ${INDEX}  IN RANGE  5  
    #     Log To Console    ${INDEX}
    # END

    
    # WHILE  '${USER}' == 'rh' and ${INDEX} < 5
    #     Log To Console    Este usuario e RH
    #     ${INDEX}    Evaluate    ${INDEX} + 1
    # END
    
    # Sleep    2s
    # Close Browser


Quando informo o usuário no login
    [Arguments]    ${USER_ARG}
    Wait Until Element Is Visible    dom:${DOM_USER}
    Input Text    dom:${DOM_USER}    ${USER_ARG}
    Click Element    dom:${BOTAO_PROSSEGUIR}

E informo a senha
    [Arguments]    ${PASS_ARG}
    Wait Until Element Is Visible    dom:${DOM_PASS}
    ## Wait Until Element Is Visible    dom:${BOTAO_PROSSEGUIR}
    Input Text    dom:${DOM_PASS}    ${PASS_ARG}

Entao faco o login
    ## Wait Until Element Is Visible    ${BOTAO_PROSSEGUIR}
    Click Element    dom:${BOTAO_PROSSEGUIR}
    ## Sleep    2s

Fecho o navegador
    Close Browser