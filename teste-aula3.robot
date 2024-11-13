*** Settings ***
Library    SeleniumLibrary


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
    Dado que eu acesso o login do sankhya com sucesso
    #Quando infomro o usuário no login
    #E informo a senha
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

    
    WHILE  '${USER}' == 'rh' and ${INDEX} < 5
        Log To Console    Este usuario e RH
        ${INDEX}    Evaluate    ${INDEX} + 1
    END
    


    Sleep    2s
    Close Browser



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

Fecho o navegador
    Close Browser