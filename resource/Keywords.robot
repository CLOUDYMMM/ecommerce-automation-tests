*** Settings ***
Resource    Variables.robot

*** Keywords ***
Get shadow element
    [Documentation]    ดึง element ที่อยู่ใน shadow DOM โดยใช้ CSS selector
    [Arguments]    ${element_selector}
    ${element}=    Execute Javascript    return document.querySelector('${shadow_host}').shadowRoot.querySelector('${element_selector}')
    RETURN       ${element}

Get shadow text
    [Documentation]    ดึงข้อความจาก element ที่อยู่ใน shadow DOM และรอให้ element ปรากฏก่อน
    [Arguments]    ${element_selector}
    Wait Until Keyword Succeeds    10x    0.5s    Execute Javascript    var h=document.querySelector('${shadow_host}'); return !!(h && h.shadowRoot && h.shadowRoot.querySelector('${element_selector}'));
    ${text}=    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(h && h.shadowRoot){ var el=h.shadowRoot.querySelector('${element_selector}'); return el ? (el.textContent||'') : ''; } return '';
    RETURN       ${text}

Open signin page
    [Documentation]    เปิด browser และนำทางไปยังหน้า signin ผ่านปุ่ม account
    Open Browser    ${Home_URL}    edge    executable_path=${EDGE_DRIVER}
    Maximize Browser Window
    Click Button    ${xpath_btn_account}
    Click Element    ${xpath_nav_signin}
    Verify redirect to signin page
    Log    Signin page opened

Click create account
    [Documentation]    คลิกปุ่ม Create Account ที่อยู่ใน shadow DOM
    ${create_account}=    Get Shadow Element    ${css_create_account}
    Click Element         ${create_account}
    Sleep                 1s
    Log    Create Account link clicked

Input signup form
    [Documentation]    กรอกข้อมูลในฟอร์มสมัครสมาชิก (ชื่อ, เบอร์โทร, อีเมล, รหัสผ่าน)
    [Arguments]    ${fullname}=${FULLNAME}    ${mobile}=${MOBILE}    ${email}=${EMAIL}    ${password}=${PASSWORD}
    Input Text    ${fullname_input}        ${fullname}
    Input Text    ${mobile_input}          ${mobile}
    Input Text    ${signup_email}          ${email}
    Input Text    ${signup_password}       ${password}
    Input Text    ${signup_confirm}        ${password}
    Log    Signup form filled

Confirm create account
    [Documentation]    ยืนยันการสร้างบัญชีโดยคลิกปุ่ม Create Account
    Click Element    ${btn_create_account}
    Sleep            2s
    Log    Account creation confirmed

Input signin data
    [Documentation]    กรอกข้อมูลเข้าสู่ระบบ (อีเมลและรหัสผ่าน) และคลิกปุ่ม signin
    ${email_input}=     Get Shadow Element    ${css_email}
    ${password_input}=  Get Shadow Element    ${css_password}
    Input Text          ${email_input}        ${EMAIL}
    Input Text          ${password_input}     ${PASSWORD}

    ${signin_btn}=      Get Shadow Element    ${css_btn_signin}
    Click Element       ${signin_btn}
    Sleep    3s
    Verify Signin Success
    Log    Signin completed

Search for mug on search bar and click suggestion
    [Documentation]    ค้นหา "Mug" ในช่องค้นหาและเลือก "Ceramic Mug" จากคำแนะนำ
    Wait Until Element Is Visible    ${xpath_search_bar}    timeout=5s
    Input Text    ${xpath_search_bar}    Mug
    Sleep    1s
    Wait Until Element Is Visible    ${xpath_search_suggestion_ceramic_mug}    timeout=5s
    Click Element    ${xpath_search_suggestion_ceramic_mug}
    Sleep   3s
    Log    Search completed

Click search button
    [Documentation]    คลิกปุ่มค้นหา
    Wait Until Element Is Visible    ${xpath_search_btn_testid}    timeout=5s
    Click Button    ${xpath_search_btn_testid}
    Sleep    2s
    Log    Search button clicked

Search for ceramic mug on search bar
    [Documentation]    ค้นหา "Ceramic Mug" ในช่องค้นหา และกดปุ่มค้นหา
    Wait Until Element Is Visible    ${xpath_search_bar}    timeout=5s
    Input Text    ${xpath_search_bar}    Ceramic Mug
    Sleep    1s
    Log    Search completed

Find ceramic mug product
    [Documentation]    ค้นหาและรอให้ Ceramic Mug product ปรากฏในหน้า products
    Wait Until Keyword Succeeds    10x    1s    Execute Javascript    var h=document.querySelector('${products_shadow_host}'); return !!(h && h.shadowRoot && h.shadowRoot.querySelector('${ceramic_mug_product}')); 
    Log    Ceramic Mug product found

Click view details for ceramic mug
    [Documentation]    คลิกปุ่ม View Details ของ Ceramic Mug โดยใช้ CSS selector
    ${view_details_btn}=    Get Shadow Element    ${ceramic_mug_view_details}
    Wait Until Element Is Visible    ${view_details_btn}    timeout=5s
    Click Element    ${view_details_btn}
    Sleep    3s
    Log    View Details clicked for Ceramic Mug

    
Select white ceramic mug
    [Documentation]    เลือกสีขาวสำหรับ Ceramic Mug ที่อยู่ใน shadow DOM
    ${white_btn}=    Get Shadow Element    ${color_white_btn}
    Wait Until Element Is Visible    ${white_btn}    timeout=5s
    Click Element    ${white_btn}
    sleep  5s
    Log    White Ceramic Mug selected

Open cart page
    [Documentation]    เปิดหน้าตะกร้าสินค้าโดยคลิกที่ไอคอนตะกร้า
    Wait Until Element Is Visible    ${xpath_cart}    timeout=5s
    Click Element    ${xpath_cart}
    Sleep    2s
    Log    Cart page opened

Add multiple ceramic mugs To cart
    [Documentation]    เพิ่ม Ceramic Mug หลายชิ้นลงในตะกร้าโดยระบุจำนวน
    [Arguments]    ${quantity}=3

    # Set the quantity
    ${qty_input}=    Get Shadow Element    ${Mug_qty_input}
    Clear Element Text    ${qty_input}
    Input Text    ${qty_input}    ${quantity}

    # Click Add to Cart
    ${cart_btn}=    Get Shadow Element    ${add_to_cart_btn}
    Wait Until Element Is Enabled    ${cart_btn}    timeout=5s
    Click Element    ${cart_btn}

    Sleep    5s  
    Log    3 Ceramic Mugs added to cart

Select all items in cart
    [Documentation]    เลือกสินค้าทั้งหมดในตะกร้าด้วยปุ่ม Select All
    ${select_all}=     Get Shadow Element    ${cart_select_all}
    Click Element      ${select_all}
    Sleep              5s
    Log    All items selected

Select coupon general12345
    [Documentation]    เลือกคูปอง General12345 จาก dropdown และกด Apply
    # เปิด dropdown
    ${dropdown}=     Get Shadow Element    ${coupon_dropdown}
    Click Element    ${dropdown}
    Sleep            1s

    # เลือกรายการคูปอง General12345
    ${coupon_item}=  Get Shadow Element    ${coupon_list_item}
    Click Element    ${coupon_item}
    Sleep            1s

    # กด Apply
    ${apply_btn}=    Get Shadow Element    ${coupon_apply_btn}
    Click Element    ${apply_btn}
    Sleep            2s
    Log    Coupon applied

Verify checkout total
    [Documentation]    ตรวจสอบยอดรวมในหน้า checkout ว่าถูกต้อง (รวมส่วนลด, ค่าจัดส่ง, VAT)
    [Arguments]    ${discount_text}=None

    # ดึงตัวเลขจากหน้า Checkout
    ${total_text}=       Get Shadow Text    ${cart_total}
    ${subtotal_text}=    Get Shadow Text    ${cart_subtotal}
    ${shipping_text}=    Get Shadow Text    ${cart_shipping}
    ${vat_text}=         Get Shadow Text    ${cart_vat}

    # แปลงเป็น float
    ${total}=       Evaluate    float(__import__('re').sub(r'[^0-9.]','', '''${total_text}'''))
    ${subtotal}=    Evaluate    float(__import__('re').sub(r'[^0-9.]','', '''${subtotal_text}'''))
    ${shipping}=    Evaluate    float(__import__('re').sub(r'[^0-9.]','', '''${shipping_text}'''))
    ${vat}=         Evaluate    float(__import__('re').sub(r'[^0-9.]','', '''${vat_text}'''))

    # ถ้ามี discount ให้เอามาลบจาก subtotal
    ${discount}=    Set Variable    0
    Run Keyword If    ${discount_text}    ${discount}=    Evaluate    float(__import__('re').sub(r'[^0-9.]','', '''${discount_text}'''))

    # Compute expected total: subtotal ± discount + shipping + VAT
    ${expected_total}=    Evaluate    ${subtotal} - ${discount} + ${shipping} + ${vat}

    # Assertions
    Should Be Equal As Numbers    ${total}    ${expected_total}
    Should Be Equal As Numbers    ${total}    323.00
    Log    Checkout total verified




Remove all cart items
    [Documentation]    ลบสินค้าทั้งหมด: วนคลิก Remove+Confirm จนไม่มี container สินค้า top-level เหลือ
    ${count}=    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(h&&h.shadowRoot){ return h.shadowRoot.querySelectorAll('${cart_item_container}').length; } return 0;
    WHILE    ${count} > 0
        # คลิก Remove ของแถวแรก
        Execute Javascript    var h=document.querySelector('${shadow_host}'); if(h&&h.shadowRoot){ var item=h.shadowRoot.querySelector('${cart_item_container}'); if(item){ var btn=item.querySelector('${cart_remove_btn}'); if(btn){ try{btn.click();}catch(e){} } } }
        
        # รอ overlay confirm ปรากฏ
        Wait Until Keyword Succeeds    20x    0.25s    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(!(h&&h.shadowRoot)) return false; return h.shadowRoot.querySelector('${cart_confirm_overlay}') !== null;

        # คลิก Confirm ด้วย selector ที่ระบุชัดเจน
        Wait Until Keyword Succeeds    20x    0.25s    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(h&&h.shadowRoot){ var c=h.shadowRoot.querySelector('${cart_confirm_btn}'); if(c){ try{c.click();}catch(e){} try{c.dispatchEvent(new MouseEvent('click',{bubbles:true}));}catch(e){} return true; } } return false;

        # รอ overlay หายไป
        Wait Until Keyword Succeeds    40x    0.25s    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(!(h&&h.shadowRoot)) return false; return h.shadowRoot.querySelector('${cart_confirm_overlay}') === null;

        # อัปเดตจำนวนแถวคงเหลือ
        ${count}=    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(h&&h.shadowRoot){ return h.shadowRoot.querySelectorAll('${cart_item_container}').length; } return 0;
    END
    Sleep    5s
    Log    All cart items removed

Verify cart is empty
    [Documentation]    ตรวจสอบว่าตะกร้าสินค้าว่างเปล่า โดยดูข้อความ "Your cart is empty" หรือจำนวนสินค้าเป็น 0
    # รอจนกว่าจะพบข้อความว่าง หรือไม่มีแถวสินค้าเหลือ
    Wait Until Keyword Succeeds    20x    0.5s    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(!(h&&h.shadowRoot)) return false; var emptyEl=h.shadowRoot.querySelector('${cart_empty_message}'); var rows=h.shadowRoot.querySelectorAll('${cart_item_container}').length; return (emptyEl!==null) || (rows===0);

    # อ่านข้อความอย่างปลอดภัย (ถ้าไม่มีให้คืนค่าว่าง)
    ${empty_text}=    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(h&&h.shadowRoot){ var el=h.shadowRoot.querySelector('${cart_empty_message}'); return el ? (el.textContent||'').trim() : ''; } return '';
    ${rows}=    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(h&&h.shadowRoot){ return h.shadowRoot.querySelectorAll('${cart_item_container}').length; } return 0;

    Run Keyword If    '${empty_text}'!=''    Should Be Equal    ${empty_text}    Your cart is empty.
    Run Keyword If    '${empty_text}'==''    Should Be Equal As Integers    ${rows}    0
    sleep     5s
    Log    Cart is empty verified

Verify signin success
    [Documentation]    ตรวจสอบว่าการเข้าสู่ระบบสำเร็จ โดยดู URL และอีเมลที่แสดงในปุ่ม account
    Location Should Be    ${Home_URL}
    Page Should Contain Element    ${xpath_btn_account}
    Element Should Contain    ${xpath_btn_account}    ${EMAIL}
    Log    Signin verified

Verify signup success   
    [Documentation]    ตรวจสอบว่าการสมัครสมาชิกสำเร็จ โดยดู URL และอีเมลที่แสดงในปุ่ม account
    Location Should Be    ${Home_URL}
    Page Should Contain Element    ${xpath_btn_account}
    Element Should Contain    ${xpath_btn_account}    ${EMAIL}
    Log    Signup verified

Verify redirect to signin page
    [Documentation]    ตรวจสอบว่าถูกนำทางไปยังหน้า signin ถูกต้อง
    Location Should Be    ${Signin_URL}
    Log    Redirect to signin page verified

Verify redirect to signup page
    [Documentation]    ตรวจสอบว่าถูกนำทางไปยังหน้า signup ถูกต้อง
    Location Should Be     ${Signup_URL}
    Log    Redirect to signup page verified

  

    
