*** Settings ***

Resource    Variables.robot
Resource    Keywords.robot

*** Keywords ***
Search and click suggestion
    [Arguments]    ${query}    ${suggestion_text}
    Wait Until Element Is Visible    ${xpath_search_bar}    timeout=5s
    Input Text    ${xpath_search_bar}    ${query}
    Wait Until Element Is Visible    xpath=//*[normalize-space(text())='${suggestion_text}']    timeout=5s
    Click Element    xpath=//*[normalize-space(text())='${suggestion_text}']
    Sleep    2s

Search for product
    [Arguments]    ${query}    
    Wait Until Element Is Visible    ${xpath_search_bar}    timeout=5s
    Input Text    ${xpath_search_bar}    ${query}
    Log    Search completed


Find product by name
    [Arguments]    ${product_name}
    Wait Until Keyword Succeeds    10x    1s    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(!h||!h.shadowRoot){return false;} var items=h.shadowRoot.querySelectorAll('a[data-testid^="product-card-name-"]'); for(var i=0;i<items.length;i++){ if((items[i].textContent||'').trim()==='${product_name}') return true; } return false;
    ${found_name}=    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(!h||!h.shadowRoot){return '';} var items=h.shadowRoot.querySelectorAll('a[data-testid^="product-card-name-"]'); for(var i=0;i<items.length;i++){ var t=(items[i].textContent||'').trim(); if(t==='${product_name}') return t; } return '';
    Should Be Equal    ${found_name}    ${product_name}
    Log    ${product_name} product found

Click view details for product
    [Arguments]    ${product_name}
    ${view_details_btn}=    Execute Javascript    var h=document.querySelector('${shadow_host}'); if(!h||!h.shadowRoot){return null;} var names=h.shadowRoot.querySelectorAll('a[data-testid^="product-card-name-"]'); for(var i=0;i<names.length;i++){ var a=names[i]; if((a.textContent||'').trim()==='${product_name}'){ var li=a.closest('li[data-testid^="product-card-"]'); return li ? li.querySelector('button[data-testid^="product-card-view-"]') : null; } } return null;
    Wait Until Element Is Visible    ${view_details_btn}    timeout=5s
    Click Element    ${view_details_btn}
    Sleep  3s
    Log    View Details clicked for ${product_name}


Click search button
    [Documentation]    กดปุ่ม Search ในแถบค้นหา
    Wait Until Element Is Visible    ${xpath_search_btn_testid}    timeout=5s
    Click Button    ${xpath_search_btn_testid}
    Sleep  2s
    Log    Search button clicked




Select product color
    [Arguments]    ${product_name}    ${color}
    ${white_btn}=    Get Shadow Element    ${color_white_btn}
    Wait Until Element Is Visible    ${white_btn}    timeout=5s
    Click Element    ${white_btn}
    Sleep  5s
    Log    ${product_name} ${color} selected

Add multiple products To cart
    [Documentation]    เพิ่มจำนวนสินค้า
    [Arguments]    ${product_name}    ${quantity}=3
    ${qty_input}=    Get Shadow Element    ${Mug_qty_input}
    Clear Element Text    ${qty_input}
    Input Text    ${qty_input}    ${quantity}
    ${cart_btn}=    Get Shadow Element    ${add_to_cart_btn}
    Wait Until Element Is Enabled    ${cart_btn}    timeout=5s
    Click Element    ${cart_btn}
    Sleep  5s
    Log    ${quantity} ${product_name} added to cart
