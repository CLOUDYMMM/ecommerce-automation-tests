*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${REGISTER_URL}    https://web-demo.qahive.com/e-commerce/register
${EMAIL_PREFIX}    testuser
${EMAIL_DOMAIN}    @example.com
${PASSWORD}        TestPassword123!
${NAME}            Test User
${GENDER}          Male

*** Test Cases ***
Register New Account
    [Documentation]    Test registration of a new account
    [Teardown]    Close Browser
    
    ${RANDOM_STRING}=    Generate Random String    8    [LETTERS]
    ${EMAIL}=    Set Variable    ${EMAIL_PREFIX}${RANDOM_STRING}${EMAIL_DOMAIN}
    
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    Call Method    ${options}    add_argument    --headless
    
    Open Browser    ${REGISTER_URL}    chrome    options=${options}
    
    Input Text    xpath=//input[@name='email']    ${EMAIL}
    Input Text    xpath=//input[@name='password']    ${PASSWORD}
    Input Text    xpath=//input[@name='name']    ${NAME}
    Select From List By Value    xpath=//select[@name='gender']    ${GENDER}
    Click Button    xpath=//button[contains(.,'Submit') or @type='submit']
    
    Wait Until Location Contains    /e-commerce    20s
