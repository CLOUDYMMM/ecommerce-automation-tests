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

Submit Form
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

Click Add to Cart 1
    Click Button    ${xpath_add_to_cart1}

Click Add to Cart 2
    Click Button    ${xpath_add_to_cart2}

Click Cart icon
    Click Element    ${xpath_cart} 


Verify Product In Cart
    [Arguments]    ${PRODUCT_NAME}    ${PRODUCT_PRICE}
    ${xpath_name}=    Set Variable    //h5[text()='${PRODUCT_NAME}']
    ${xpath_price}=   Set Variable    //h5[text()='${PRODUCT_NAME}']/following::h5[@class='mb-0'][1]
    Element Should Contain    ${xpath_name}    ${PRODUCT_NAME}
    Element Should Contain    ${xpath_price}   ${PRODUCT_PRICE}
Verify Total Price
    [Arguments]    ${EXPECTED_TOTAL}
    ${xpath_total_label}=    Set Variable    ${XPATH_TOTAL_LABEL}
    ${xpath_total_price}=   Set Variable    ${XPATH_TOTAL_PRICE}
    Element Should Contain    ${xpath_total_label}    Total
    Element Should Contain    ${xpath_total_price}    ${EXPECTED_TOTAL}