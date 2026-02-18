*** Comments ***
╔═══════════════════════════════════════════════════════════════════════════════╗
║ FILE:         02_products_page.robot                                          ║
║ PURPOSE:      Page Object Model for SauceDemo.com Products/Inventory Page     ║
║                                                                               ║
║ DESCRIPTION:                                                                  ║
║   This file contains all web element locators and reusable keywords           ║
║   for performing functional activities on the SauceDemo products page.        ║
║   Following the Page Object Model design pattern, it separates the            ║
║   page structure from test logic for better maintainability.                  ║
║                                                                               ║
║ SET TEST VARIABLES:                                                           ║
║   These test-level variables enable data sharing between keywords within the  ║
║   same test case execution, promoting reusability and reducing parameter      ║
║   passing overhead.                                                           ║
║                                                                               ║
║   1. ${prod}  - Selected product name for cross-keyword access                ║
║   2. ${price} - Product price for validation across test flow                 ║
║                                                                               ║
║ DEPENDENCIES:                                                                 ║
║   - QWeb Library:         For web automation and element interactions         ║
║   - QVision Library:      Enables visual element detection and text-based     ║
║                           interactions                                        ║
║   - base_test.robot:      Contains common utilities and test setup/teardown   ║
║   - 01_login_page.robot:  User must be authenticated to access products page  ║
║                                                                               ║
║ APPLICATION:  https://www.saucedemo.com/inventory.html                        ║
╚═══════════════════════════════════════════════════════════════════════════════╝

*** Settings ***
Library            QWeb

Resource            ../utilities/base_test.robot

*** Variables ***
${prod_page_header_ele}            //span[@class='title']
${prod_expected_page_header}       Products
${cart_link}                       //a[@class='shopping_cart_link']
${burger_menu}                     //button[@id='react-burger-menu-btn']

*** Keywords ***
Validate user landed on Products page
    [Documentation]        Verifies successful navigation to the Products page by validating the page header text
    
    ${actual}              GetText        ${prod_page_header_ele}
    Run Keyword And Continue On Failure
    ...                    Should Be Equal As Strings    ${actual}    ${prod_expected_page_header}

Select Product and Validate the price
    [Documentation]            Selects a specific product from the inventory and verifies that the displayed price matches the expected value
    [Arguments]                ${prod}    ${price}

    ${prod_price_ele}          Set Variable            //div[@class='inventory_item' and .//div[text()='${prod}']]//div[@class='inventory_item_price']
    ${prod_price_value}        GetText                 ${prod_price_ele}
    Run Keyword And Continue On Failure
    ...                        Should Be Equal As Strings        ${prod_price_value}        ${price}
    Set Test Variable          ${prod_data}                      ${prod}
    Set Test Variable          ${price_data}                     ${price}       
        

Add Product to the Cart
    [Documentation]        Clicks the 'Add to Cart' button for a specified product to add it to the shopping cart

    ${add_cart_ele}        Set Variable            //div[@class='inventory_item' and .//div[text()='${prod_data}']]//button
    ClickElement           ${add_cart_ele}

Click on Cart Link
    [Documentation]        Navigates to the shopping cart page by clicking the cart icon in the header

    ClickElement           ${cart_link}

Logout from Sauce Demo Application
    [Documentation]        Logs out the current user by accessing the menu and clicking the logout option
    
    ClickElement           ${burger_menu}
    ClickText              Logout
