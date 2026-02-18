*** Comments ***
╔════════════════════════════════════════════════════════════════════════════════╗
║ FILE:         06_checkout_complete_page.robot                                  ║
║ PURPOSE:      Page Object Model for SauceDemo.com Order Confirmation Page      ║   
║                                                                                ║                
║ DESCRIPTION:                                                                   ║
║   This file contains all web element locators and reusable keywords for        ║  
║   performing functional activities on the SauceDemo order confirmation/checkout║ 
║   complete page. Following the Page Object Model design pattern, it separates  ║
║   the page structure from test logic for better maintainability.               ║
║                                                                                ║
║ DEPENDENCIES:                                                                  ║ 
║   - QWeb Library:            For web automation and element interactions       ║
║   - base_test.robot:         Contains common utilities and test setup/teardown ║
║   - 01_login_page.robot:     User authentication                               ║ 
║   - 02_products_page.robot:  Product selection                                 ║   
║   - 03_cart_page.robot:      Cart management                                   ║ 
║   - 04_user_info_page.robot: Checkout information entry                        ║    
║   - 05_checkout_page.robot:  Order review and completion                       ║ 
║                                                                                ║
║ APPLICATION:  https://www.saucedemo.com/checkout-complete.html                 ║   
╚════════════════════════════════════════════════════════════════════════════════╝

*** Settings ***
Library            QWeb

Resource           ../utilities/base_test.robot

*** Variables ***
${success_msg_ele}               //h2
${detail_msg_ele}                //div[@class='complete-text']
${expected_success_msg}          Thank you for your order!
${expected_detail_msg}           Your order has been dispatched, and will arrive just as fast as the pony can get there!
${back_home_button}              //button[@id='back-to-products']

*** Keywords ***
Validate Success Messages post Order Submission
    [Documentation]                  Verifies that the success message is displayed after order submission

    ${actual_success_msg}            GetText                      ${success_msg_ele}
    Should Be Equal As Strings       ${actual_success_msg}        ${expected_success_msg}

    ${actual_detail_msg}             GetText                      ${detail_msg_ele}
    Should Be Equal As Strings       ${actual_detail_msg}         ${expected_detail_msg}

Navigate back to Products page
    [Documentation]            Navigates back to the products page from the current page

    ClickElement               ${back_home_button}