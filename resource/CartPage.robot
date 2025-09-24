*** Settings ***
Resource    Variables.robot
Resource    Keywords.robot

*** Keywords ***
Open cart page
    [Documentation]    เปิดหน้าตะกร้าสินค้า
    Wait Until Element Is Visible    ${xpath_cart}    timeout=5s
    Click Element    ${xpath_cart}
    Sleep  2s
    Log    Cart page opened

Select all items in cart
    [Documentation]    เลือกสินค้าทั้งหมดในตะกร้า
    ${select_all}=     Get Shadow Element    ${cart_select_all}
    Click Element      ${select_all}
    Sleep  5s
    Log    All items selected

Select coupon general12345
    [Documentation]    เลือกคูปองส่วนลด
    ${dropdown}=     Get Shadow Element    ${coupon_dropdown}
    Click Element    ${dropdown}
    Sleep  1s
    ${coupon_item}=  Get Shadow Element    ${coupon_list_item}
    Click Element    ${coupon_item}
    Sleep  1s
    ${apply_btn}=    Get Shadow Element    ${coupon_apply_btn}
    Click Element    ${apply_btn}
    Sleep  2s
    Log    Coupon applied

Verify checkout total
    [Documentation]    เช็คคำนวนราคารวมในหน้าตะกร้าสินค้า
    [Arguments]    ${discount_text}=None
    ${total_text}=       Get Shadow Text    ${cart_total}
    ${subtotal_text}=    Get Shadow Text    ${cart_subtotal}
    ${shipping_text}=    Get Shadow Text    ${cart_shipping}
    ${vat_text}=         Get Shadow Text    ${cart_vat}
    ${total}=       Evaluate    float(__import__('re').sub(r'[^0-9.]','', '''${total_text}'''))
    ${subtotal}=    Evaluate    float(__import__('re').sub(r'[^0-9.]','', '''${subtotal_text}'''))
    ${shipping}=    Evaluate    float(__import__('re').sub(r'[^0-9.]','', '''${shipping_text}'''))
    ${vat}=         Evaluate    float(__import__('re').sub(r'[^0-9.]','', '''${vat_text}'''))
    ${discount}=    Set Variable    0
    Run Keyword If    ${discount_text}    ${discount}=    Evaluate    float(__import__('re').sub(r'[^0-9.]','', '''${discount_text}'''))
    ${expected_total}=    Evaluate    ${subtotal} - ${discount} + ${shipping} + ${vat}
    Should Be Equal As Numbers    ${total}    ${expected_total}
    Should Be Equal As Numbers    ${total}    323.00
    Log    Checkout total verified

Remove all cart items
    [Documentation]    ลบสินค้าทุกชิ้นในตะกร้าสินค้า
    ${count}=    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(h&&h.shadowRoot){ return h.shadowRoot.querySelectorAll('${cart_item_container}').length; } return 0;
    WHILE    ${count} > 0
        Execute Javascript    var h=document.querySelector('${shadow_host}'); if(h&&h.shadowRoot){ var item=h.shadowRoot.querySelector('${cart_item_container}'); if(item){ var btn=item.querySelector('${cart_remove_btn}'); if(btn){ try{btn.click();}catch(e){} } } }
        Wait Until Keyword Succeeds    10x    0.25s    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(!(h&&h.shadowRoot)) return false; return h.shadowRoot.querySelector('${cart_confirm_overlay}') !== null;
        Wait Until Keyword Succeeds    10x    0.25s    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(h&&h.shadowRoot){ var c=h.shadowRoot.querySelector('${cart_confirm_btn}'); if(c){ try{c.click();}catch(e){} try{c.dispatchEvent(new MouseEvent('click',{bubbles:true}));}catch(e){} return true; } } return false;
        Wait Until Keyword Succeeds    20x    0.25s    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(!(h&&h.shadowRoot)) return false; return h.shadowRoot.querySelector('${cart_confirm_overlay}') === null;
        ${count}=    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(h&&h.shadowRoot){ return h.shadowRoot.querySelectorAll('${cart_item_container}').length; } return 0;
    END
    Sleep  5s
    Log    All cart items removed

Verify cart is empty
    Wait Until Keyword Succeeds    20x    0.5s    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(!(h&&h.shadowRoot)) return false; var emptyEl=h.shadowRoot.querySelector('${cart_empty_message}'); var rows=h.shadowRoot.querySelectorAll('${cart_item_container}').length; return (emptyEl!==null) || (rows===0);
    ${empty_text}=    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(h&&h.shadowRoot){ var el=h.shadowRoot.querySelector('${cart_empty_message}'); return el ? (el.textContent||'').trim() : ''; } return '';
    ${rows}=    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(h&&h.shadowRoot){ return h.shadowRoot.querySelectorAll('${cart_item_container}').length; } return 0;
    Run Keyword If    '${empty_text}'!=''    Should Be Equal    ${empty_text}    Your cart is empty.
    Run Keyword If    '${empty_text}'==''    Should Be Equal As Integers    ${rows}    0
    Sleep  5s
    Log    Cart is empty verified
