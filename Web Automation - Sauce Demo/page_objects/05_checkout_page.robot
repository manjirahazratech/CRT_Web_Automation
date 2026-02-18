*** Comments ***
╔═══════════════════════════════════════════════════════════════════════════════╗
║ FILE:         05_checkout_page.robot                                          ║
║ PURPOSE:      Page Object Model for SauceDemo.com Checkout Overview Page      ║
║                                                                               ║
║ DESCRIPTION:                                                                  ║
║   This file contains all web element locators and reusable keywords for       ║
║   performing functional activities on the SauceDemo checkout overview/summary ║
║   page. Following the Page Object Model design pattern, it separates the page ║
║   structure from test logic for better maintainability.                       ║
║                                                                               ║
║ DEPENDENCIES:                                                                 ║
║   - QWeb Library:            For web automation and element interactions      ║
║   - base_test.robot:         Contains common utilities and test setup/teardown║
║   - 01_login_page.robot:     User must be authenticated                       ║
║   - 02_products_page.robot:  Products must be selected                        ║
║   - 03_cart_page.robot:      Cart must contain items                          ║
║   - 04_user_info_page.robot: User information must be provided                ║
║                                                                               ║
║ APPLICATION:  https://www.saucedemo.com/checkout-step-two.html                ║
╚═══════════════════════════════════════════════════════════════════════════════╝

*** Settings ***
Library            QWeb

Resource           ../utilities/base_test.robot
Resource           02_products_page.robot

*** Variables ***
${checkout_prod_ele}                //div[@class='inventory_item_name']
${checkout_price_ele}               //div[@class='inventory_item_price']

${summary_price_ele}               //div[@class='summary_subtotal_label']
${summary_tax_ele}                 //div[@class='summary_tax_label']
${summary_total_ele}               //div[@class='summary_total_label']

${checkout_finish_button}          //button[@id='finish']

*** Keywords ***
Validate Product Name in Checkout page
    [Documentation]              Verifies the product name displayed on checkout page matches expected value

    ${checkout_prod_name}        GetText        ${checkout_prod_ele}
    Run Keyword And Continue On Failure
    ...                          Should Be Equal As Strings    ${checkout_prod_name}    ${prod_data}

Validate Product Price in Checkout page
    [Documentation]                Verifies that the product price displayed on the checkout page matches the expected value

    ${checkout_price_value}        GetText        ${checkout_price_ele}
    Run Keyword And Continue On Failure
    ...                            Should Be Equal As Strings    ${checkout_price_value}    ${price_data}

Validate Item Total field in Summary Section
    [Documentation]                Verifies that the item total in summary section matches the expected calculated amount
    
    ${summary_price_value}         GetText        ${summary_price_ele}
    Run Keyword And Continue On Failure
    ...                            Should Be Equal As Strings    ${summary_price_value}    Item total: ${price_data}

Validate Price Total is Sum of Item Total and Tax
    [Documentation]        Verifies that price total equals the sum of item total and tax amount

    ${tax}                 GetText            ${summary_tax_ele}        between=Tax: $???            float=True
    ${item_total}          GetText            ${summary_price_ele}      between=Item total: $???     float=True

    ${expected_total}      Evaluate           ${item_total}+${tax}
    
    ${actual_total}        GetText            ${summary_total_ele}      between=Total: $???          float=True
    Run Keyword And Continue On Failure
    ...                    Should Be Equal As Numbers          ${expected_total}       ${actual_total}     precision=2

Click on Finish
    [Documentation]        Clicks the Finish button to complete the checkout process

    ClickElement           ${checkout_finish_button}