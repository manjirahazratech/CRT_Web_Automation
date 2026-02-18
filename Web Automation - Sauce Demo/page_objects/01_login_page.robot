*** Comments ***
╔═══════════════════════════════════════════════════════════════════════════════╗
║ FILE:         01_login_page.robot                                             ║
║ PURPOSE:      Page Object Model for SauceDemo.com Login Page                  ║
║                                                                               ║
║ DESCRIPTION:                                                                  ║
║   This file contains all web element locators and reusable keywords for       ║
║   performing functional activities on the SauceDemo login page. Following the ║
║   Page Object Model design pattern, it separates the page structure from test ║
║   logic for better maintainability.                                           ║
║                                                                               ║
║ DEPENDENCIES:                                                                 ║
║   - QWeb Library:         For web automation and element interactions         ║
║   - base_test.robot:      Contains common utilities and test setup/teardown   ║
║                                                                               ║
║ CONFIGURATION VARIABLES:                                                      ║
║  The following variables are defined in the Robot Configuration and used      ║
║  throughout this page object:                                                 ║
║                                                                               ║
║  - ${reg_username}:      Registered/valid username for SauceDemo login        ║
║  - ${reg_password}:      Registered/valid password for SauceDemo login        ║
║                                                                               ║
║  These configuration variables enable centralized credential management and   ║
║  easy updates across multiple test suites without modifying individual files. ║
║                                                                               ║
║ APPLICATION:  https://www.saucedemo.com                                       ║
╚═══════════════════════════════════════════════════════════════════════════════╝

*** Settings ***
Library         QWeb

Resource        ../utilities/base_test.robot

*** Variables ***
${page_header_ele}            //div[@class='login_logo']
${expected_page_header}       Swag Labs

${username_ele}               //input[@id='user-name']
${password_ele}               //input[@id='password']
${login_button}               //input[@id='login-button']

${error_msg_ele}              //h3


*** Keywords ***
Validate Login Page Header
    [Documentation]            Verifies that the Swag Labs login page header is displayed correctly

    ${actual}                  GetText            ${page_header_ele}
    Run Keyword And Continue On Failure
    ...                        Should Be Equal As Strings    ${actual}    ${expected_page_header}

Login with Valid Credential
    [Documentation]            Logs into SauceDemo application using registered valid credentials

    TypeText                   ${username_ele}            ${reg_username}
    TypeText                   ${password_ele}            ${reg_password}
    ClickElement               ${login_button}
    Run Keyword And Continue On Failure
    ...                        VerifyNoElement            ${error_msg_ele}

Login with Invalid Credential
    [Documentation]            Attempts login with invalid credentials and validates that the appropriate error message is displayed
    [Arguments]                ${inv_uname}            ${inv_pass}        ${exp_err_msg}  

    TypeText                   ${username_ele}                ${inv_uname}
    TypeText                   ${password_ele}                ${inv_pass}
    ClickElement               ${login_button}
    ${actual_err_msg}          GetText                        ${error_msg_ele}
    Run Keyword And Continue On Failure
    ...                        Should Contain                 ${actual_err_msg}              ${exp_err_msg}