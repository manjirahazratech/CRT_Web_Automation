*** Comments ***
╔═════════════════════════════════════════════════════════════════════════╗
║ Test Case: TC01 - Single Data User Login with Valid Credentials         ║   
║═════════════════════════════════════════════════════════════════════════║
║ Purpose:                                                                ║
║   Validates end-to-end user login functionality using valid             ║
║   credentials and verifies successful navigation to Products page       ║
║                                                                         ║
║ Test Scope:                                                             ║
║   - User authentication with valid username and password                ║
║   - Login form interaction and submission                               ║
║   - Post-login navigation verification                                  ║
║   - Products page landing confirmation                                  ║
║                                                                         ║
║ Data Management:                                                        ║
║   This test case does NOT use CRT Test Data Service.                    ║
║   Credentials and URL are stored as configuration variables             ║
║   at Robot label level for direct access.                               ║
║                                                                         ║
║ Prerequisites:                                                          ║
║   - Configuration variables must be defined at Robot label              ║
║   - Application URL must be accessible                                  ║
║                                                                         ║
║ Expected Result:                                                        ║
║   User successfully logs in and lands on Products page with             ║
║   visible "Products" header text                                        ║
╚═════════════════════════════════════════════════════════════════════════╝

*** Settings ***
Resource        ../utilities/master_resource.robot

Suite Setup          Suite Setup Activities
Test Setup           Open SauceDemo Application
Test Teardown        Logout from Sauce Demo Application
Suite Teardown       Suite Teardown Activities

*** Test Cases ***
01_Validate User Login with valid credentials
    Validate Login Page Header
    Login with Valid Credential
    Validate user landed on Products page