*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Primeiro teste com robot
    Dado que acesso o sistema saucedemo
    Quando eu digito as crendenciais
    Entao acesso o sistema
    E seleciono o produto Sauce Labs Bike Light
    E fecho o sistema    

*** Keywords ***
Dado que acesso o sistema saucedemo
    Open Browser    browser=Chrome
    Go To     url=https://www.saucedemo.com/
    Maximize Browser Window
    Sleep    2s

Quando eu digito as crendenciais
    Input Text    name:user-name    standard_user
    Input Password    id:password    secret_sauce

Entao acesso o sistema
    Click Element    id:login-button 
    Sleep    2s

E seleciono o produto Sauce Labs Bike Light
    Click Button    id:add-to-cart-sauce-labs-backpack
    Sleep    2s

E fecho o sistema
    Close Browser


    #//input[@id='password']