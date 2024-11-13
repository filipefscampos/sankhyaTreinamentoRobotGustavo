*** Settings ***
Library    SeleniumLibrary
Resource    ../Objects/tela-login.resource
Resource    ../../Data/tela-login.resource


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