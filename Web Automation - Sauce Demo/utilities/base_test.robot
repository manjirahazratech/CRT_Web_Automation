*** Comments ***
╔═══════════════════════════════════════════════════════════════════════════════════╗
║ FILE:         base_test.robot                                                     ║   
║ PURPOSE:      Base Test Utilities and Common Framework Components                 ║  
║                                                                                   ║
║ DESCRIPTION:                                                                      ║
║   This file serves as the foundation for all test automation in the SauceDemo     ║
║   test suite. It contains shared utilities, common setup and teardown procedures, ║
║   reusable helper keywords, and core test framework configurations that are       ║
║   inherited by all test cases and page object models.                             ║
║                                                                                   ║
║ DEPENDENCIES:                                                                     ║
║ - QWeb Library:           Primary web automation framework                        ║
║ - QVision Library:        Enables visual element detection and text-based         ║
║                           interactions                                            ║
║ - String Library:         Enables string manipulation, verification, and          ║
║                           text processing capabilities                            ║
║ - Robot Framework:        Core test automation framework (v6.0+)                  ║
║ - Python:                 Python 3.8+ runtime environment                         ║
║                                                                                   ║
║ DESIGN PATTERN:                                                                   ║
║   This file implements the Page Object Model (POM) support structure:             ║
║   - Centralizes common functionality to avoid duplication                         ║
║   - Provides consistent setup/teardown across all tests                           ║
║   - Enables framework-wide configuration changes from single location             ║
║   - Promotes DRY (Don't Repeat Yourself) principle                                ║
║   - Facilitates easier maintenance and scalability                                ║
║                                                                                   ║
║ APPLICATION:  SauceDemo E-Commerce Test Automation Framework                      ║
║             https://www.saucedemo.com                                             ║
╚═══════════════════════════════════════════════════════════════════════════════════╝

*** Settings ***
Library        QWeb
Library        QVision
Library        String


*** Keywords ***
Open SauceDemo Application
    [Documentation]            Opens and navigates to the SauceDemo application URL

    OpenBrowser                ${url}        chrome    --guest

Suite Setup Activities
    [Documentation]             Initializes the test environment and prerequisites before suite execution
    
    Evaluate                    random.seed()    random

Suite Teardown Activities
    [Documentation]                     Cleans up the test environment and resources after suite execution completes
    
    Run Keyword And Ignore Error        DeleteAllCookies
    Run Keyword                         CloseAllBrowsers

Generate Unique Name
    [Documentation]        Generates a unique name string for use in test data

    ${fName}               Generate Random String    6    [LOWER]
    RETURN                 ${fName}

Generate Unique Number
    [Documentation]        Generates a unique number string for use in test data

    ${num}                 Generate Random String    5    [NUMBER]
    RETURN                 ${num}
