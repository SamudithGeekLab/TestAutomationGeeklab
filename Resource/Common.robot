*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}            https://dev.geeklab.app/login
${BROWSER}        Chrome


*** Keywords ***
Start TestCase
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Tear Down
    Close Browser