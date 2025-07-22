*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${REGISTER_URL}    https://web-demo.qahive.com/e-commerce/register
${EMAIL}           testuser1@example.com
${PASSWORD}        TestPassword123!
${NAME}           Test User
${GENDER}         male

# Element Locators
${xpath_email}    xpath=//input[@name='email']    
${xpath_password}    xpath=//input[@name='password']    
${xpath_name}    xpath=//input[@name='name']   
${xpath_gender}     xpath=//input[@data-testid='${GENDER}']
${xpath_register}    xpath=//button[@data-testid='loginLink']
${xpath_login}    xpath=//button[@data-testid='loginLink']
${xpath_submit}    xpath=//button[@data-testid='submit']
${xpath_ecommerce_tab}    xpath=//*[@id="root"]/section/main/aside[2]/div/div/div/a[1]
${xpath_profile_tab}    xpath=/html/body/div/section/main/aside[2]/div/div/div/a[2]
