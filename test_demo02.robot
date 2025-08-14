*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    resource/Variables.robot
Resource    resource/Keywords.robot    


*** Test Cases ***
TC-0001 Register New Account
    [Documentation]    Test registration of a new account and verify redirection to eCommerce page
    Open Registration Page
    Click Register button
    Input Registration Info  
    Keywords.Submit Form
    Click Login button
    Verify Registration Success
    [Teardown]    Close Browser

TC-0002 Login with Valid Credentials
    [Documentation]    Test Login of e-commerce page
    Open Registration Page
    Input Login Info
    Keywords.Submit Form
    Verify Login Success
    [Teardown]     Close Browser

TC-0003 Navigate between tab
    [Documentation]    Navigate between product page and profile page
    Open Registration Page
    Input Login Info
    Keywords.Submit Form
    Verify Login Success
    Verify ECommerce Success
    Click Profile Tab
    Verify Profile Success
    Click ECommerce Tab
    Verify ECommerce Success
    [Teardown]    Close Browser

TC-0004 Add to Cart
    [Documentation]    Test adding an item to the cart
    Open Registration Page
    Input Login Info
    Keywords.Submit Form
    Verify Login Success
    Verify ECommerce Success
    Click ECommerce Tab
    Verify ECommerce Success
    Click Add to Cart 1
    Click Add to Cart 2
    Click Cart icon
    Sleep  2s
    [Teardown]    Close Browser

TC-0005 Verify Cart Contents
    [Documentation]    Test verifying the contents of the cart
    Open Registration Page
    Input Login Info
    Keywords.Submit Form
    Verify Login Success
    Verify ECommerce Success
    Click ECommerce Tab
    Verify ECommerce Success
    Click Add to Cart 1
    Click Add to Cart 2
    Click Cart icon
    Verify Product In Cart    Travel Bag     3000
    Verify Product In Cart    Apple Watch    12500
    Verify Total Price   15500
    Sleep    2s
    [Teardown]    Close Browser

