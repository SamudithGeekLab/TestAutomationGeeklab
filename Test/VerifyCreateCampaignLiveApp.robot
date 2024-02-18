*** Settings ***
Documentation     This is a simple test suite to create campaign using LIVE app
Library 	SeleniumLibrary
Resource 	../Resource/Common.robot

*** Variables ***
${USERNAME}       samudith@geeklab.app
${PASSWORD}       Geek@12345

#URL and Expected URL
${EXPECTED_URL}   https://dev.geeklab.app/dashboard

#Locators
${USERNAME_FIELD}                  //input[@id='react-aria-1']
${PASSWORD_FIELD}                  //input[@id='react-aria-3']
${NEW_CAMPAIGN}                    //b[@class='nextui-c-PJLV nextui-c-PJLV-ijnlmIz-css z-1 relative mr-auto p-4 !text-white']
${CAMPAIGN_LABELTEXT}              //p[contains(text(),'CREATE A NEW CAMPAIGN')]
${SELECT_APP_DROPDOWN}             //*[contains(@class,'svg-inline--fa fa-angle-down fa-lg')]
${CREATE_DRAFT}                    //span[contains(text(),'Create draft')]/parent::button
${ADD_NEW}                         //div[contains(text(),'Add new')]
${ADD_NEW_APP}                     //p[contains(text(),'Add new app')]
${APPSTORE_DROPDOWN}               //input[contains(@placeholder,'URL')]/parent::label/parent::div/parent::div/parent::div/following-sibling::div//p[contains(text(),'App')]/parent::div/preceding-sibling::span/parent::button
${PLAYSTORE_SELECTION}             //span[contains(text(),'Play')]
${APPNAME_SEARCH}                  //span[contains(text(),'App')]/following-sibling::input
${SEARCH_BUTTON}                   //span[contains(text(),'search')]
${APP_RELATED_SELECT}              //p[contains(text(),'Asphalt 9')]/parent::div/following-sibling::button
${DRAFT_BUTTON}                    //span[contains(text(),'Create draft')]/parent::button 
${PP_PROJECT}                      //p[contains(text(),'Project')]   
${PP_SUBMIT}                       //button[contains(text(),'Submit')] 
${CONFIRM_SUBMIT}                  //span[contains(text(),'Submit')]
${CAMPAIGN_LIVE}                   //div[contains(text(),'Your campaign is live!')]

*** Keywords ***

login to Dashboard
    Input Text    ${USERNAME_FIELD}    ${USERNAME}    clear=True
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}    clear=True
    Click Button    //button[@type='submit']
    Sleep    5
    ${current_url}=    Get Location
    Should Be Equal As Strings    ${current_url}    ${EXPECTED_URL}


*** Test Cases ***

Verify the functionality to create a new campaign using LIVE app in Google Play Store

    Start TestCase

    login to Dashboard

    # Click on the new campaign button
    Wait Until Element Is Visible   ${NEW_CAMPAIGN}
    Element Should Be Visible    ${NEW_CAMPAIGN}
    Click Element    ${NEW_CAMPAIGN}
    Sleep    3
    
    # Verify the label text and the create draft button is disabled
    Wait Until Element Is Visible   ${CAMPAIGN_LABELTEXT}
    ${current_labelText}=    Get Text    ${CAMPAIGN_LABELTEXT}
    Should Be Equal As Strings    ${current_labelText}    CREATE A NEW CAMPAIGN
    Log    Current label text: ${current_labelText}
    Element Should Be Disabled    ${CREATE_DRAFT}
    
    # Click on the "select an app" dropdown
    Click Element  ${SELECT_APP_DROPDOWN}
    Sleep   3
    
    # Click on the "Add new" button
    Wait Until Element Is Visible    ${ADD_NEW} 
    Click Element    ${ADD_NEW} 

    # Verify "Add new app" popup is visible
    Wait Until Element Is Visible    ${ADD_NEW_APP} 
    Sleep    2
    
    # Store selection dropwdown click   
    Scroll Element Into View    ${APPSTORE_DROPDOWN}
    Wait Until Element Is Visible    ${APPSTORE_DROPDOWN}    10s
    Sleep    5
    Click Element    ${APPSTORE_DROPDOWN}

    # Select Play Store from the dropdown
    Wait Until Element Is Visible    ${PLAYSTORE_SELECTION}    5
    Click Element    ${PLAYSTORE_SELECTION}

    # Input the text to the search box
    Input Text     ${APPNAME_SEARCH}  asphault 9
    Click Element    ${SEARCH_BUTTON}

    # Select the "Select" relevant to app searched
    Wait Until Element Is Visible    ${APP_RELATED_SELECT}    20
    Click Button    ${APP_RELATED_SELECT} 

    # Verify "Create draft" button is enabled and click
    Sleep    10
    Wait Until Element Is Visible    ${DRAFT_BUTTON}   20
    Element Should Be Enabled    ${DRAFT_BUTTON}  
    Click Element    ${DRAFT_BUTTON} 

    # Verify navigation to the "Product Page" edit mode
    Wait Until Element Is Visible   ${PP_PROJECT}   20

    # Click on the "Submit" button in product page
    Wait Until Element Is Visible    ${PP_SUBMIT}     20
    Sleep    5
    Click Button    ${PP_SUBMIT}

    # Click on the "Submit" button in the Confirm popup
    Wait Until Element Is Visible    ${CONFIRM_SUBMIT}    20
    Sleep    2
    Click Element    ${CONFIRM_SUBMIT}

    # Verify the "Your campaign is live!" message in dashboard
    Wait Until Element Is Visible    ${CAMPAIGN_LIVE}  20


    Tear Down
