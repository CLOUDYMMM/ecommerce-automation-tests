*** Settings ***
Library    SeleniumLibrary
Library    Collections
Resource    resource/Variables.robot
Resource    resource/Keywords.robot    
Resource    resource/CartPage.robot
Resource    resource/LoginPage.robot
Resource    resource/SignupPage.robot
Resource    resource/ProductPage.robot


*** Test Cases ***

TC-0001 Add to cart and checkout cart with mug search 
    [Documentation]     search for 3 mug and add to cart then verify checkout is updated and correct price
        Open signin page
        Input signin data
        Search for mug on search bar and click suggestion
        Select white ceramic mug
        Add multiple ceramic mugs To cart
        Open cart page
        Select all items in cart
        Select coupon general12345
        Verify checkout total
        Remove all cart items
        Verify Cart Is Empty
    [Teardown]     Close Browser

TC-0002 Add to cart and Checkout Cart with Ceramic Mug search
    [Documentation]    search for 3 ceramic mug and add to cart then verify checkout is updated and correct price
        Open signin page
        Input signin data
        Search for ceramic mug on search bar
        Click search button
        Find ceramic mug product
        Click view details for ceramic mug
        Select white ceramic mug
        Add multiple ceramic mugs To cart
        Open cart page
        Select all items in cart
        Select coupon general12345
        Verify checkout total
        Remove all cart items
        Verify cart is empty
    [Teardown]     Close Browser



