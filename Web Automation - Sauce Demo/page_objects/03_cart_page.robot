*** Comments ***
╔═══════════════════════════════════════════════════════════════════════════════╗
║ FILE:         03_cart_page.robot                                              ║
║ PURPOSE:      Page Object Model for SauceDemo.com Shopping Cart Page          ║
║                                                                               ║
║ DESCRIPTION:                                                                  ║
║   This file contains all web element locators and reusable keywords for       ║
║   performing functional activities on the SauceDemo shopping cart page.       ║  
║   Following the Page Object Model design pattern, it separates the page       ║  
║   structure from test logic for better maintainability.                       ║
║                                                                               ║
║ Test Variables:                                                               ║
║   Keywords utilize Set Test Variable to store and retrieve:                   ║
║   1. ${prod_data}  - Product name captured from products page                 ║
║   2. ${price_data} - Product price captured from products page                ║
║   These test-level variables enable data sharing between keywords within      ║
║   the same test case execution, allowing validation of items added from       ║
║   the products page.                                                          ║
║                                                                               ║
║ DEPENDENCIES:                                                                 ║
║   - QWeb Library:           For web automation and element interactions       ║
║   - base_test.robot:        Contains common utilities and test setup/teardown ║
║   - 01_login_page.robot:    User must be authenticated to access cart         ║
║   - 02_products_page.robot: Products must be selected before cart validation  ║
║                                                                               ║
║ APPLICATION:  https://www.saucedemo.com/cart.html                             ║
╚═══════════════════════════════════════════════════════════════════════════════╝

*** Settings ***
Library            QWeb

Resource           ../utilities/base_test.robot
Resource           02_products_page.robot

*** Variables ***
${cart_prod_ele}                //div[@class='inventory_item_name']
${cart_price_ele}               //div[@class='inventory_item_price']
${cart_checkout_button}         //button[@id='checkout']

*** Keywords ***
Validate Product Name in Cart page
    [Documentation]          Verifies that the selected product name is displayed correctly in the shopping cart

    ${cart_prod_name}        GetText        ${cart_prod_ele}
    Run Keyword And Continue On Failure
    ...                      Should Be Equal As Strings    ${cart_prod_name}        ${prod_data}

Validate Product Price in Cart page
    [Documentation]            Verifies that the product price is displayed correctly in the shopping cart

    ${cart_price_value}        GetText        ${cart_price_ele}
    Run Keyword And Continue On Failure
    ...                        Should Be Equal As Strings    ${cart_price_value}    ${price_data}

Click on Checkout button
    [Documentation]        Clicks the checkout button to proceed to the checkout information page

    ClickElement           ${cart_checkout_button}
