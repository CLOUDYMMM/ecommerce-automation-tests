*** Settings ***
Resource    Variables.robot
Resource    Keywords.robot

*** Keywords ***
Click create account
    [Documentation]    กด Create account 
    ${create_account}=    Get Shadow Element    ${css_create_account}
    Click Element         ${create_account}
    Sleep                 1s
    Log    Create Account link clicked

Input signup form
    [Documentation]    กรอกข้อมูล Fullname mobile email password 
    [Arguments]    ${fullname}=${FULLNAME}    ${mobile}=${MOBILE}    ${email}=${EMAIL}    ${password}=${PASSWORD}
    Input Text    ${fullname_input}        ${fullname}
    Input Text    ${mobile_input}          ${mobile}
    Input Text    ${signup_email}          ${email}
    Input Text    ${signup_password}       ${password}
    Input Text    ${signup_confirm}        ${password}
    Log    Signup form filled

Confirm create account
    [Documentation]    กดยืนยันการสร้าง Account
    Click Element    ${btn_create_account}
    Sleep            2s
    Log    Account creation confirmed

Verify signup success
    [Documentation]    ยืนยันการสมัครสำเร็จ
    Location Should Be    ${Home_URL}
    Page Should Contain Element    ${xpath_btn_account}
    Element Should Contain          ${xpath_btn_account}    ${EMAIL}
    Log    Signup verified

Verify redirect to signup page
    [Documentation]    ยืนยันการนำทางไปหน้า signup
    Location Should Be     ${Signup_URL}
    Log    Redirect to signup page verified
