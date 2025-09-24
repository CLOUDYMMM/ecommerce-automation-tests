*** Settings ***
Resource    Variables.robot
Resource    Keywords.robot

*** Keywords ***
Open signin page
    [Documentation]    เปิดหน้าเว็บไซต์เพื่อ Login
    Open Browser    ${Home_URL}    edge    executable_path=${EDGE_DRIVER}
    Maximize Browser Window
    Click Button    ${xpath_btn_account}
    Click Element   ${xpath_nav_signin}
    Verify redirect to signin page
    Log    Signin page opened

Input signin data
    [Documentation]    กรอกข้อมูลใส่หน้า Login
    ${email_input}=     Get Shadow Element    ${css_email}
    ${password_input}=  Get Shadow Element    ${css_password}
    Input Text          ${email_input}    ${EMAIL}
    Input Text          ${password_input}  ${PASSWORD}
    ${signin_btn}=      Get Shadow Element    ${css_btn_signin}
    Click Element       ${signin_btn}
    Sleep    5s
    Verify signin success
    Log    Signin completed

Verify signin success
    [Documentation]    ตรวจสอบ Login ผ่าน 
    Location Should Be    ${Home_URL}
    Page Should Contain Element    ${xpath_btn_account}
    Element Should Contain          ${xpath_btn_account}    ${EMAIL}
    Log    Signin verified

Verify redirect to signin page
    [Documentation]    ตรวจสอบว่าถูกนำทางไปยังหน้า signin ถูกต้อง
    Location Should Be    ${Signin_URL}
    Log    Redirect to signin page verified