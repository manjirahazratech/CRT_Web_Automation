*** Comments ***
╔═════════════════════════════════════════════════════════════════════════════╗
║ Test Case: TC02 - Data Driven User Login with Invalid Credentials           ║ 
║═════════════════════════════════════════════════════════════════════════════║
║ Purpose:                                                                    ║
║   This test suite validates the login functionality of the SauceDemo        ║ 
║   application using invalid credentials through a data-driven approach.     ║   
║   The test template executes multiple times automatically based on the      ║  
║   test data configured in CRT Test Data Service.                            ║
║                                                                             ║
║ Data-Driven Configuration:                                                  ║  
║   - Test Template: "Invalid Login Scenario" runs for each data row          ║
║   - Data Source: CRT Test Data Service (SauceDemoTestData.xlsx)             ║
║   - Data Reader: TestDataApi (Copado Robotic Testing)                       ║
║   - Number of Executions: Determined by rows in test data file              ║
║                                                                             ║
║ Test Data Structure (from CRT Test Data Service):                           ║
║   - td_username: Username to attempt login (invalid credentials)            ║
║   - td_password: Password to attempt login (invalid credentials)            ║
║   - td_err_msg: Expected error message to validate after login attempt      ║
║                                                                             ║
║ Test Scope:                                                                 ║
║   1. Open SauceDemo application                                             ║
║   2. Validate login page header is displayed                                ║
║   3. Attempt login with invalid credentials from test data row              ║
║   4. Verify expected error message matches td_err_msg value                 ║
╚═════════════════════════════════════════════════════════════════════════════╝

*** Settings ***
Library         DataDriver    reader_class=TestDataApi    name=SauceDemoTestData.xlsx

Resource        ../utilities/master_resource.robot

Suite Setup          Suite Setup Activities
Test Setup           Open SauceDemo Application
Test Template        Validate Invalid Login
Suite Teardown       Suite Teardown Activities

*** Keywords ***
Validate Invalid Login
    [Arguments]    ${td_username}    ${td_password}    ${td_err_msg}
    
    Validate Login Page Header
    Login with Invalid Credential    ${td_username}    ${td_password}    ${td_err_msg}

*** Test Cases ***
Validate Invalid Login for ${td_err_msg}



  