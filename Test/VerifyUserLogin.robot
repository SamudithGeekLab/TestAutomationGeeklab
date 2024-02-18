*** Settings ***
Documentation     This is a simple test suite for the Geeklab login page
Library 	SeleniumLibrary
Resource 	../Resource/Common.robot

*** Variables ***
${USERNAME}       samudith@geeklab.app
${PASSWORD}       Geek@12345

#URL and Expected URL
${EXPECTED_URL}   https://dev.geeklab.app/dashboard

#Locators
${USERNAME_FIELD}    //input[@id='react-aria-1']
${PASSWORD_FIELD}    //input[@id='react-aria-3']

*** Test Cases ***
Verify the Geeklab login and navigate to the dashboard
    
    Start TestCase

    Input Text    ${USERNAME_FIELD}    ${USERNAME}    clear=True
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}    clear=True
    Click Button    //button[@type='submit']
    Sleep    5
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    ${EXPECTED_URL}
    
    Tear Down

