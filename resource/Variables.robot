*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${EDGE_DRIVER}    C:/WebDrivers/Edge/msedgedriver.exe
${Signin_URL}    https://training-platform2.doppio-tech.com/signin
${Signup_URL}     https://training-platform2.doppio-tech.com/signup
${Home_URL}    https://training-platform2.doppio-tech.com/
${Cart_URL}    https://training-platform2.doppio-tech.com/cart
${EMAIL}            Matichai062@gmail.com  
${PASSWORD}         Cloud0625928956 
${FULLNAME}         Matichai Duangjit
${MOBILE}           0625928956


# Element Locators for Shadow host
${shadow_host}       [data-testid="shadow-host"]
${css_email}         input[data-testid="signin-email"]
${css_password}      input[data-testid="signin-password"]
${css_btn_signin}    button[data-testid="signin-submit"]
${color_white_btn}   button[data-testid="pd-opt-color-White"]
${Mug_qty_input}    input[data-testid="pd-qty-input"]
${add_to_cart_btn}   button[data-testid="pd-add-to-cart"]
${css_create_account}    a[data-signin="signin-form0-div7-a1"]


#Coupon shadow host
${coupon_dropdown}       button[data-cart="cart-div0-div1-div1-aside1-section1-div1-button0"]
${coupon_list_item}      button[data-cart="cart-div0-div1-div1-aside1-section1-div2-ul2-li0-button0"]
${coupon_apply_btn}      button[data-cart="cart-div0-div1-div1-aside1-section1-div2-div1-button1"]

# Cart Totals in shadow host
${cart_subtotal}     span[data-cart="cart-div0-div1-div1-aside1-section0-div1-span1"]
${cart_shipping}     span[data-cart="cart-div0-div1-div1-aside1-section0-div2-span1"]
${cart_vat}          span[data-cart="cart-div0-div1-div1-aside1-section0-div3-span1"]
${cart_total}        span[data-cart="cart-div0-div1-div1-aside1-section0-div4-span1"]
${cart_root}              div[data-cart="cart-div0"]
${cart_remove_buttons}     css=button[data-cart*="button2"]
${cart_confirm_button}    css=button[data-cart*="button1"]
${cart_item_rows}         css=div[data-cart*="div0-div1-div1-div0-div0-div0"]
${cart_select_all}    input[data-cart="cart-div0-div1-div0-label0-input0"]
${cart_item_prices}    div[data-cart*="div1-div0-div1-div2"]
${cart_empty_msg}    css=p[data-cart="cart-div0-p1"]
${cart_percent_spans}    span[aria-label^="cart-span-"]


# Element Locators for Signin page
${xpath_email}    xpath=//input[@data-testid="signin-email"]
${xpath_password}    xpath=//input[@data-testid="signin-password"]  
${xpath_btn_account}    xpath=//*[@id="btn-account"]
${xpath_nav_signin}    xpath=//*[@data-testid="nav-account-signin"]
${xpath_btn_signin}    xpath=//button[@data-testid="signin-submit"]
${xpath_create_account}    xpath=//a[@data-signin="signin-form0-div7-a1"]

# Signup form inputs for shadow host
${fullname_input}    input[data-testid="signup-fullname"]
${mobile_input}      input[data-testid="signup-phone"]
${signup_email}      input[data-testid="signup-email"]
${signup_password}   input[data-testid="signup-password"]
${signup_confirm}    input[data-testid="signup-confirm"]
${btn_create_account}    button[data-testid="signup-submit"]
${btn_back_signin}       a[data-signup="signup-form0-div14-a1"]

# Element Locators for Search Bar
${xpath_search_bar}    xpath=//*[@id="nav-search-input"]
${xpath_search_suggestion_ceramic_mug}    xpath=//*[normalize-space(text())='Ceramic Mug']

# Search Button Selectors 
${xpath_search_btn_basic}    xpath=//*[@id="btn-search"]
${xpath_search_btn_testid}    xpath=//button[@data-testid="nav-search-submit"]
${xpath_search_btn_submit}    xpath=//button[@type="submit"]
${xpath_search_btn_aria}    xpath=//button[@aria-label="Search"]
${css_search_btn}    css=button[data-testid="nav-search-submit"]

# Element Locators for Cart 
${xpath_cart}    xpath=//a[@data-testid="nav-cart"]
${select_all}    xpath=//*[@id="cart-root"]/div/div[1]/label/input

# Cart item management selectors
${cart_item_container}    div[data-cart="cart-div0-div1-div1-div0-div0"]
${cart_remove_btn}        button[data-cart*="button2"]
${cart_confirm_overlay}   div[data-cart="cart-div0-div1-div2"]
${cart_confirm_btn}       button[data-cart="cart-div0-div1-div2-div0-div2-button1"]
${cart_empty_message}     p[data-cart="cart-div0-p1"]

# Product page selectors (in shadow DOM)
${products_shadow_host}   [data-testid="shadow-host"]
${ceramic_mug_product}    li[data-testid="product-card-11"]
${ceramic_mug_name}       a[data-testid="product-card-name-11"]
${ceramic_mug_view_details}    button[data-testid="product-card-view-11"]
${ceramic_mug_view_details_id}    #btn-view-11