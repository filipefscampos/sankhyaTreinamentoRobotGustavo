*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${BASE_URL}    https://postman-rest-api-learner.glitch.me/
${URI_GET}    /info?id=40293dsasa&nome=sankhya
${URI_POST}    /info
${DATA}        {"userID": 1, "empresa": "Sankhya", "cod_empresa": "10", "Colab": {"nome": "seu nome", "cargo": "QA"}}

*** Test Cases ***
Validando API do postman POST
    Dado que acesso a api do postman POST


*** Keywords ***
Dado que acesso a api do postman POST
    Create Session    jsonplaceholder    ${BASE_URL}
    #Log To Console    ${DATA}
    ${COLAB}    Create Dictionary    nome=Filipe    cargo=QA
    ${REQUEST}=   Create Dictionary    userID=1    empresa=Sankhya    cod_empresa=10    Colab=${COLAB}    #nome=Filipe    cargo=QA
    ${RESPONSE}=    POST On Session    jsonplaceholder    ${URI_POST}    json=${REQUEST}
    #Log To Console    ${RESPONSE.json()}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    200
    Should Be Equal   ${RESPONSE.json()["message"]}    You made a POST request with the following data!
    Should Be Equal   ${RESPONSE.json()["data"]["userID"]}    1
    Should Be Equal   ${RESPONSE.json()["data"]["empresa"]}    Sankhya
    Should Be Equal   ${RESPONSE.json()["data"]["cod_empresa"]}    10
    Should Be Equal   ${RESPONSE.json()["data"]["Colab"]["nome"]}   Filipe
    Should Be Equal   ${RESPONSE.json()["data"]["Colab"]["cargo"]}   QA