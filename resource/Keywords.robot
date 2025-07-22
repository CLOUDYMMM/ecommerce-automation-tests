*** Settings ***
Resource    Variables.robot

*** Keywords ***
Open Registration Page
    Open Browser    ${REGISTER_URL}    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    xpath=//input[@name='email']    10s


Input Registration Info
    Input Text    ${xpath_email}    ${EMAIL}
    Input Text    ${xpath_password}    ${PASSWORD}
    Input Text    ${xpath_name}    ${NAME}
    Click Element  ${xpath_gender} 

Input Login Info
    Input Text     ${xpath_email}    ${EMAIL}
    Input Text     ${xpath_password}    ${PASSWORD}

Submit Registration Form
    Click Button    ${xpath_submit}

Verify Registration Success
    Wait Until Location Contains    /register    10s
    Location Should Contain    /register

Verify Login Success
    Wait Until Location Contains    /e-commerce    10s
    Location Should Contain    /e-commerce

Verify ECommerce Success
    Wait Until Location Contains    /e-commerce/product-list    10s
    Location Should Contain    e-commerce/product-list

Verify Profile Success
    Wait Until Location Contains    /e-commerce/profile    10s
    Location Should Contain    e-commerce/profile

Click Register button
    Click Button    ${xpath_register}

Click Login button
    Click Button    ${xpath_login} 

Click ECommerce Tab
    Scroll Element Into View    ${xpath_ecommerce_tab}
    Wait Until Element Is Visible    ${xpath_ecommerce_tab}    10s
    Click Element    ${xpath_ecommerce_tab}

Click Profile Tab
    Scroll Element Into View    ${xpath_profile_tab}
    Wait Until Element Is Visible    ${xpath_profile_tab}    10s
    Click Element    ${xpath_profile_tab}
