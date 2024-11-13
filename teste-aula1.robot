*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Primeiro teste com robot
    Dado que acesso o sistema saucedemo
    Quando eu digito as crendenciais
    Então acesso o sistema
    E fecho o sistema    

*** Keywords ***
Dado que acesso o sistema saucedemo
    Open Browser    browser=Chrome
    Go To     url=https://www.saucedemo.com/
    Maximize Browser Window
    Click Element    id:login-button
    Sleep    2s

Quando eu digito as crendenciais
    Input Text    name:user-name    standard_user
    Input Password    id:password    secret_sauce

Então acesso o sistema
    Click Element    id:login-button
    Sleep    2s

E fecho o sistema
    Close Browser


    #//input[@id='password']