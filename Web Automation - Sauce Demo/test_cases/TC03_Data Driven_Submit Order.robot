*** Comments ***
╔═════════════════════════════════════════════════════════════════════════════╗
║ TEST CASE: TC03 - Data Driven Submit Order                                  ║ 
║═════════════════════════════════════════════════════════════════════════════║
║ Purpose:                                                                    ║
║   This test case validates the end-to-end order submission workflow on      ║
║   SauceDemo application usingdata-driven testing approach. :                ║
║   - Log in with their credentials                                           ║
║   - Add products to the shopping cart                                       ║
║   - Complete the checkout process with their information                    ║
║   - Verify order confirmation                                               ║
║   The test executes multiple iterations with different test data sets to    ║
║   ensure the workflow works correctly for various product scenarios.        ║
║                                                                             ║
║ Data-Driven Configuration:                                                  ║
║   - Test Template: "Submit Order" runs for each data row                    ║
║   - Data Source: CRT Test Data Service (SauceDemoTestData.xlsx)             ║
║   - Execution Mode: Sequential iteration through all data rows              ║
║   - Data Reader: TestDataApi (Copado Robotic Testing)                       ║
║   - Number of Executions: Determined by rows in test data file              ║
║                                                                             ║
║ Test Data Structure (from CRT Test Data Service):                           ║
║   - td_product: Product Name to be ordered                                  ║
║   - td_price:   Price of the product                                        ║
║                                                                             ║
║ Test Scope:                                                                 ║
║   - User authentication (login with valid credentials)                      ║
║   - Product catalog page navigation and display                             ║
║   - Adding single product to shopping cart                                  ║
║   - Checkout process                                                        ║
║   - User information entry                                                  ║
║   - Order submission and completion                                         ║
║   - Order confirmation message verification                                 ║
║   - Logout functionality                                                    ║
╚═════════════════════════════════════════════════════════════════════════════╝


*** Settings ***
Library         DataDriver    reader_class=TestDataApi    name=SauceDemoTestData.xlsx

Resource            ../utilities/master_resource.robot

Suite Setup          Suite Setup Activities
Test Setup           Open SauceDemo Application
Test Teardown        Logout from Sauce Demo Application
Suite Teardown       Suite Teardown Activities
Test Template        Submit Order

*** Keywords ***
Submit Order
    [Arguments]    ${td_product}    ${td_price}

    Login with Valid Credential
    Validate user landed on Products page
    Select Product and Validate the price    ${td_product}    ${td_price}
    Add Product to the Cart
    Click on Cart Link
    Validate Product Name in Cart page
    Validate Product Price in Cart page
    Click on Checkout button
    Enter User Information and Continue
    Validate Product Name in Checkout page
    Validate Product Price in Checkout page
    Validate Item Total field in Summary Section
    Validate Price Total is Sum of Item Total and Tax
    Click on Finish
    Validate Success Messages post Order Submission
    Navigate back to Products page

*** Test Cases ***
Submit Order with product ${td_product}