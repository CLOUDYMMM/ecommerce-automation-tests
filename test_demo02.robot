*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    resource/Variables.robot
Resource    resource/Keywords.robot    


*** Test Cases ***
TC-0001 Register New Account
    [Documentation]    Test registration of a new account and verify redirection to eCommerce page
    Open Registration Page
    Maximize Browser Window
    Click Register button
    Input Registration Info  
    Submit Registration Form
    Click Login button
    Verify Registration Success
    [Teardown]    Close Browser

TC-0002 Login with Valid Credentials
    [Documentation]    Test Login of e-commerce page
    Open Registration Page
    Maximize Browser Window
    Input Login Info
    Submit Registration Form
    Verify Login Success
    [Teardown]     Close Browser

TC-0003 Navigate between tab
    [Documentation]    Navigate between product page and profile page
    Open Registration Page
    Maximize Browser Window
    Input Login Info
    Submit Registration Form
    Verify Login Success
    Verify ECommerce Success
    Click Profile Tab
    Verify Profile Success
    Click ECommerce Tab
    Verify ECommerce Success
    [Teardown]    Close Browser



