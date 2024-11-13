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
Informar usuário 3 vezes com for e if aninhado
    Dado que eu acesso o login do sankhya com sucesso
    Quando infomro o usuário no login
    #E informo a senha
    #Entao faco o login
    Fecho o navegador


*** Keywords ***
Dado que eu acesso o login do sankhya com sucesso
    Open Browser    ${URBL_BASE}    ${NAVEGADOR}
    Maximize Browser Window

Quando infomro o usuário no login
    Wait Until Element Is Visible    dom:${DOM_USER}
    Input Text    dom:${DOM_USER}    ${USER}
    #Click Element    dom:${BOTAO_PROSSEGUIR}

    # IF  '${USER}' == 'r41541851'
    #     Log To Console    Este e o usuario RH
    # ELSE
    #     Log To Console    Nao e o user RH
    # END
    

    FOR  ${INDEX}  IN RANGE  3  
         Log To Console    ${INDEX}
         IF     '${INDEX}' < '2'
             Input Text    dom:${DOM_USER}    automacao
             Log To Console    automacao
         ELSE IF    '${INDEX}' == '2'
             Input Text    dom:${DOM_USER}    SUP
             Log To Console    Sup
         END
    END

    
    # WHILE  '${USER}' == 'rh' and ${INDEX} < 5
    #     Log To Console    Este usuario e RH
    #     ${INDEX}    Evaluate    ${INDEX} + 1
    # END


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