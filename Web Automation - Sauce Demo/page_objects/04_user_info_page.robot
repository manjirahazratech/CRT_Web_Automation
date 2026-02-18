*** Comments ***
╔═══════════════════════════════════════════════════════════════════════════════╗
║ FILE:         04_user_info_page.robot                                         ║
║ PURPOSE:      Page Object Model for SauceDemo.com Checkout Information Page   ║
║                                                                               ║
║ DESCRIPTION:                                                                  ║
║   This file contains all web element locators and reusable keywords for       ║
║   performing functional activities on the SauceDemo checkout information page ║
║   (user info entry). Following the Page Object Model design pattern, it       ║
║   separates the page structure from test logic for better maintainability.    ║
║                                                                               ║
║ DEPENDENCIES:                                                                 ║
║   - QWeb Library:           For web automation and element interactions       ║
║   - base_test.robot:        Contains common utilities and test setup/teardown ║
║   - 01_login_page.robot:    User must be authenticated                        ║
║   - 02_products_page.robot: Products must be selected                         ║
║   - 03_cart_page.robot:     Cart must contain items and checkout initiated    ║
║                                                                               ║
║ APPLICATION:  https://www.saucedemo.com/checkout-step-one.html                ║
╚═══════════════════════════════════════════════════════════════════════════════╝

*** Settings ***
Library            QWeb

Resource           ../utilities/base_test.robot

*** Variables ***
${user_fname_ele}            //input[@id='first-name']
${user_lname_ele}            //input[@id='last-name']
${user_zcode_ele}            //input[@id='postal-code']
${user_info_cont_button}     //input[@id='continue']

*** Keywords ***
Enter User Information and Continue
    [Documentation]        Fills in the checkout form with user details and proceeds to the order overview page

    ${user_fname_val}      Run Keyword            Generate Unique Name
    TypeText               ${user_fname_ele}      Test ${user_fname_val}
    ${user_lname_val}      Run Keyword            Generate Unique Name
    TypeText               ${user_lname_ele}      Test ${user_lname_val}
    ${user_zcode_val}      Run Keyword            Generate Unique Number
    TypeText               ${user_zcode_ele}      ${user_zcode_val}
    ClickElement           ${user_info_cont_button}