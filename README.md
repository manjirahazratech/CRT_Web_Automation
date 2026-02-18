📌 Project Overview

  This project demonstrates end-to-end automation of the SauceDemo web application using Copado Robotic Testing (CRT).
  The framework is designed to be:

  ✅ Robust
  ✅ Scalable
  ✅ Reusable
  ✅ Easily Maintainable
  ✅ Data-Driven

It follows industry best practices to ensure long-term maintainability and enterprise-level implementation standards.

📌 Automation Tool & Technology

  - Automation Tool: Copado Robotic Testing (CRT)
  - Framework Type: Keyword-driven + Data-driven
  - Data Source: Excel (via Test Data Service)
  - Design Pattern: Modular & Encapsulated Robot Classes

📌 Automated Test Scenarios

  1️⃣ Login – Valid Credentials
      - Verify successful login with standard user.
      - Validate navigation to inventory page.

  2️⃣ Login – Invalid Credentials (Data-Driven)
       - Multiple negative scenarios executed using Excel test data.
       - Validates appropriate error messages.
       - Integrated with Test Data Service for dynamic data handling.

  3️⃣ Submit Order (Data-Driven & End-to-End Flow)
       - Login → Add product to cart → Checkout → Submit order.
       - Fully data-driven using Excel.
       - Validates successful order confirmation.

📌 Framework Architecture & Best Practices Implemented
   ✅ Modular Robot Design
      - Separate robot classes for:
         Login
         Inventory
         Checkout
      - Promotes reusability and maintainability.
      
   ✅ Encapsulation
      - UI interaction logic encapsulated within dedicated keywords.
      - Business logic separated from test execution flow.

   ✅ Reusable Custom Keywords
      - All repetitive actions converted into reusable keywords.
      - Keyword documentation added for clarity.

   ✅  Data-Driven Framework
      - Excel used as external data source.
      - Integrated via Test Data Service.
      - Easy to extend test coverage without code modification.

   ✅  Code Documentation & Comments
      - Comment section added in each Robot class.
      - Proper documentation for every custom keyword.
      - Improves readability and team collaboration.

   ✅  Scalable Structure
      - Easy to onboard new scenarios.
      - New test cases can be added with minimal impact.
      - Supports enterprise-level automation scaling.
