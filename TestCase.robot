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
        LoginPage.Open signin page
        LoginPage.Input signin data
        ProductPage.Search and click suggestion  Mug    Ceramic Mug
        ProductPage.Select product color    Ceramic Mug    White
        ProductPage.Add multiple products To cart   Ceramic Mug    3
        CartPage.Open cart page
        CartPage.Select all items in cart
        CartPage.Select coupon first item
        CartPage.Verify checkout total
        CartPage.Remove all cart items
        CartPage.Verify cart is empty
    [Teardown]     Close Browser

TC-0002 Add to cart and Checkout Cart with Ceramic Mug search
    [Documentation]    search for 3 ceramic mug and add to cart then verify checkout is updated and correct price
        LoginPage.Open signin page
        LoginPage.Input signin data
        ProductPage.Search for product    Ceramic Mug
        ProductPage.Click search button
        ProductPage.Find product by name    Ceramic Mug
        ProductPage.Click view details for product    Ceramic Mug    
        ProductPage.Select product color    Ceramic Mug    White
        ProductPage.Add multiple products To cart    Ceramic Mug    3
        CartPage.Open cart page
        CartPage.Select all items in cart
        CartPage.Select coupon first item
        CartPage.Verify checkout total
        CartPage.Remove all cart items
        CartPage.Verify cart is empty
    [Teardown]     Close Browser



