*** Settings ***
Documentation     This is a simple test suite for the Geeklab login page invalid credential error message validation
Library 	SeleniumLibrary
Resource 	../Resource/Common.robot

*** Variables ***
${USERNAME}       samudith@geeklab.app
${PASSWORD}       Geeklab@12345

#URL and Expected URL
${EXPECTED_URL}   https://dev.geeklab.app/dashboard
${EXPECTED_ERROR}  Invalid credentials

#Locators
${USERNAME_FIELD}    //input[@id='react-aria-1']
${PASSWORD_FIELD}    //input[@id='react-aria-3']
${ERROR_MESSAGE}     //h5[@class='nextui-c-PJLV nextui-c-PJLV-iqKmYR-weight-medium nextui-c-PJLV-ifgDYHW-css']

*** Test Cases ***
Verify the Geeklab login error message with invalid credentials
    
    Start TestCase

    Input Text    ${USERNAME_FIELD}    ${USERNAME}    clear=True
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}    clear=True
    Click Button    //button[@type='ubmit']        #failure point
    Sleep    5
    ${error_message}=    Get Text    ${ERROR_MESSAGE} 
    Log    Error Message: ${error_message}
    Should Be Equal As Strings    ${error_message}    ${EXPECTED_ERROR}
    
    Tear Down
