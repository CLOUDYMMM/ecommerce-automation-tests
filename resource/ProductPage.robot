*** Settings ***

Resource    Variables.robot
Resource    Keywords.robot

*** Keywords ***
Search for mug on search bar and click suggestion
    Wait Until Element Is Visible    ${xpath_search_bar}    timeout=5s
    Input Text    ${xpath_search_bar}    Mug
    Sleep  1s
    Wait Until Element Is Visible    ${xpath_search_suggestion_ceramic_mug}    timeout=5s
    Click Element    ${xpath_search_suggestion_ceramic_mug}
    Sleep  3s
    Log    Search completed

Search for ceramic mug on search bar
    Wait Until Element Is Visible    ${xpath_search_bar}    timeout=5s
    Input Text    ${xpath_search_bar}    Ceramic Mug
    Sleep  1s
    Log    Search completed

Click search button
    Wait Until Element Is Visible    ${xpath_search_btn_testid}    timeout=5s
    Click Button    ${xpath_search_btn_testid}
    Sleep  2s
    Log    Search button clicked

Find ceramic mug product
    Wait Until Keyword Succeeds    10x    1s    Execute Javascript    var h=document.querySelector('${products_shadow_host}'); return !!(h && h.shadowRoot && h.shadowRoot.querySelector('${ceramic_mug_product}')); 
    Log    Ceramic Mug product found

Click view details for ceramic mug
    ${view_details_btn}=    Get Shadow Element    ${ceramic_mug_view_details}
    Wait Until Element Is Visible    ${view_details_btn}    timeout=5s
    Click Element    ${view_details_btn}
    Sleep  3s
    Log    View Details clicked for Ceramic Mug

Select white ceramic mug
    ${white_btn}=    Get Shadow Element    ${color_white_btn}
    Wait Until Element Is Visible    ${white_btn}    timeout=5s
    Click Element    ${white_btn}
    Sleep  5s
    Log    White Ceramic Mug selected

Add multiple ceramic mugs To cart
    [Arguments]    ${quantity}=3
    ${qty_input}=    Get Shadow Element    ${Mug_qty_input}
    Clear Element Text    ${qty_input}
    Input Text    ${qty_input}    ${quantity}
    ${cart_btn}=    Get Shadow Element    ${add_to_cart_btn}
    Wait Until Element Is Enabled    ${cart_btn}    timeout=5s
    Click Element    ${cart_btn}
    Sleep  5s
    Log    ${quantity} Ceramic Mugs added to cart
