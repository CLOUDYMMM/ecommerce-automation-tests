*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${REGISTER_URL}    https://web-demo.qahive.com/e-commerce/register
${RANDOM_NUMBER}    ${EMPTY}
${EMAIL}           testuser${RANDOM_NUMBER}1@example.com
${PASSWORD}        TestPassword123!

*** Keywords ***
Open Registration Page
    Open Browser    ${REGISTER_URL}    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@name='email']    10s

Input Registration Info
    Input Text    xpath=//input[@name='email']    ${EMAIL}
    Input Text    xpath=//input[@name='password']    ${PASSWORD}

Submit Registration Form
    Click Button    xpath=//button[contains(.,'Submit') or @type='submit']

Verify Registration Success
    Wait Until Location Contains    /e-commerce    10s
    Location Should Contain    /e-commerce

*** Test Cases ***
Register New Account
    [Documentation]    Test registration of a new account and verify redirection to eCommerce page
    ${RANDOM_NUMBER}=    Evaluate    random.randint(1000, 9999)    random
    Set Suite Variable    ${RANDOM_NUMBER}
    Open Registration Page
    Input Registration Info
    Submit Registration Form
    Verify Registration Success
    [Teardown]    Close Browser
