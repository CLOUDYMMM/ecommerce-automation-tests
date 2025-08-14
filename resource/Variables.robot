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
${xpath_add_to_cart1}    xpath=//div[@class='card-group']/div[1]//button[contains(text(),'Add to cart')]
${xpath_add_to_cart2}    xpath=//div[@class='card-group']/div[2]//button[contains(text(),'Add to cart')]  
${xpath_cart}    xpath=//*[@id="root"]/section/main/div/div/div[1]/a
${XPATH_TOTAL_LABEL}          (//div[contains(@class,'justify-content-between')]//p[@class='mb-2'])[1]
${XPATH_TOTAL_PRICE}          (//div[contains(@class,'justify-content-between')]//p[@class='mb-2'])[2]