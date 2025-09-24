*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    resource/Variables.robot
Resource    resource/Keywords.robot    


*** Test Cases ***

TC-0001 Add to cart and checkout cart with mug search 
    [Documentation]     search for 3 mug and add to cart then verify checkout is updated and correct price
        Open Signin Page
        Input Signin Data
        Search for mug on search bar and click suggestion
        Select White Ceramic Mug
        Add Multiple Ceramic Mugs To Cart
        Open cart page
        Select All Items In Cart
        Select Coupon General12345
        Verify Checkout Total
        Remove All Cart Items
        Verify Cart Is Empty
    [Teardown]     Close Browser

TC-0002 Add to cart and Checkout Cart with Ceramic Mug search
    [Documentation]    search for 3 ceramic mug and add to cart then verify checkout is updated and correct price
        Open Signin Page
        Input Signin Data
        Search for ceramic mug on search bar
        Click Search Button
        Find Ceramic Mug Product
        Click View Details For Ceramic Mug
        Select White Ceramic Mug
        Add Multiple Ceramic Mugs To Cart
        Open cart page
        Select All Items In Cart
        Select Coupon General12345
        Verify Checkout Total
        Remove All Cart Items
        Verify Cart Is Empty
    [Teardown]     Close Browser



