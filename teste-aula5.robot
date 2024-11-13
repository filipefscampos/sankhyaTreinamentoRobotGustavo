*** Settings ***
Library    RequestsLibrary


*** Variables ***
${BASE_URL}    https://postman-rest-api-learner.glitch.me/
${URI_GET}    /info?id=40293dsasa&nome=sankhya
${URI_POST}    /info

*** Test Cases ***
Validando API do postman GET
    Dado que acesso a api do postman GET

Validando API do postman POST
    Dado que acesso a api do postman POST


*** Keywords ***
Dado que acesso a api do postman GET
    Create Session    jsonplaceholder    ${BASE_URL}
    ${RESPONSE}=    GET On Session    jsonplaceholder    ${URI_GET}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    200
    Should Contain    ${RESPONSE.json()["message"]}    You made a GET r
    Should Be Equal   ${RESPONSE.json()["message"]}    You made a GET request! 
    Log To Console    RESPONSE:>${RESPONSE}

Dado que acesso a api do postman POST
    Create Session    jsonplaceholder    ${BASE_URL}
    ${DATA_POST}    Create Dictionary    nome=sankhya    cod-empresa=10
    ${RESPONSE}=    POST On Session    jsonplaceholder    ${URI_POST}    data=${DATA_POST}
    Should Be Equal As Numbers    ${RESPONSE.status_code}    200
    Should Be Equal   ${RESPONSE.json()["message"]}    You made a POST request with the following data!
    Should Be Equal   ${RESPONSE.json()["data"]["nome"]}    sankhya
    Log To Console    RESPONSE:>${RESPONSE.json()}