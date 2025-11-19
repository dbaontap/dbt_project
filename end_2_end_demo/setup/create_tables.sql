use role SF_Intelligence_Demo;
use database sf_ai_demo;
create schema sf_ai_demo.raw;
use schema sf_ai_demo.raw;
  
  -- ========================================================================
    -- DIMENSION TABLES
    -- ========================================================================

    -- Product Category Dimension
    CREATE OR REPLACE TABLE product_category_dim (
        category_key INT PRIMARY KEY,
        category_name VARCHAR(100) NOT NULL,
        vertical VARCHAR(50) NOT NULL
    );

    -- Product Dimension
    CREATE OR REPLACE TABLE product_dim (
        product_key INT PRIMARY KEY,
        product_name VARCHAR(200) NOT NULL,
        category_key INT NOT NULL,
        category_name VARCHAR(100),
        vertical VARCHAR(50)
    );

    -- Vendor Dimension
    CREATE OR REPLACE TABLE vendor_dim (
        vendor_key INT PRIMARY KEY,
        vendor_name VARCHAR(200) NOT NULL,
        vertical VARCHAR(50) NOT NULL,
        address VARCHAR(200),
        city VARCHAR(100),
        state VARCHAR(10),
        zip VARCHAR(20)
    );

    -- Customer Dimension
    CREATE OR REPLACE TABLE customer_dim (
        customer_key INT PRIMARY KEY,
        customer_name VARCHAR(200) NOT NULL,
        industry VARCHAR(100),
        vertical VARCHAR(50),
        address VARCHAR(200),
        city VARCHAR(100),
        state VARCHAR(10),
        zip VARCHAR(20)
    );

    -- Account Dimension (Finance)
    CREATE OR REPLACE TABLE account_dim (
        account_key INT PRIMARY KEY,
        account_name VARCHAR(100) NOT NULL,
        account_type VARCHAR(50)
    );

    -- Department Dimension
    CREATE OR REPLACE TABLE department_dim (
        department_key INT PRIMARY KEY,
        department_name VARCHAR(100) NOT NULL
    );

    -- Region Dimension
    CREATE OR REPLACE TABLE region_dim (
        region_key INT PRIMARY KEY,
        region_name VARCHAR(100) NOT NULL
    );

    -- Sales Rep Dimension
    CREATE OR REPLACE TABLE sales_rep_dim (
        sales_rep_key INT PRIMARY KEY,
        rep_name VARCHAR(200) NOT NULL,
        hire_date DATE
    );

    -- Campaign Dimension (Marketing)
    CREATE OR REPLACE TABLE campaign_dim (
        campaign_key INT PRIMARY KEY,
        campaign_name VARCHAR(300) NOT NULL,
        objective VARCHAR(100)
    );

    -- Channel Dimension (Marketing)
    CREATE OR REPLACE TABLE channel_dim (
        channel_key INT PRIMARY KEY,
        channel_name VARCHAR(100) NOT NULL
    );

    -- Employee Dimension (HR)
    CREATE OR REPLACE TABLE employee_dim (
        employee_key INT PRIMARY KEY,
        employee_name VARCHAR(200) NOT NULL,
        gender VARCHAR(1),
        hire_date DATE
    );

    SELECT count(*) from employee_dim;

    -- Job Dimension (HR)
    CREATE OR REPLACE TABLE job_dim (
        job_key INT PRIMARY KEY,
        job_title VARCHAR(100) NOT NULL,
        job_level INT
    );

    -- Location Dimension (HR)
    CREATE OR REPLACE TABLE location_dim (
        location_key INT PRIMARY KEY,
        location_name VARCHAR(200) NOT NULL
    );



   -- ========================================================================
    -- FACT TABLES
    -- ========================================================================

    -- Sales Fact Table
    CREATE OR REPLACE TABLE sales_fact (
        sale_id INT PRIMARY KEY,
        date DATE NOT NULL,
        customer_key INT NOT NULL,
        product_key INT NOT NULL,
        sales_rep_key INT NOT NULL,
        region_key INT NOT NULL,
        vendor_key INT NOT NULL,
        amount DECIMAL(10,2) NOT NULL,
        units INT NOT NULL
    );

    -- Finance Transactions Fact Table
    CREATE OR REPLACE TABLE finance_transactions (
        transaction_id INT PRIMARY KEY,
        date DATE NOT NULL,
        account_key INT NOT NULL,
        department_key INT NOT NULL,
        vendor_key INT NOT NULL,
        product_key INT NOT NULL,
        customer_key INT NOT NULL,
        amount DECIMAL(12,2) NOT NULL
    );

    -- Marketing Campaign Fact Table
    CREATE OR REPLACE TABLE marketing_campaign_fact (
        campaign_fact_id INT PRIMARY KEY,
        date DATE NOT NULL,
        campaign_key INT NOT NULL,
        product_key INT NOT NULL,
        channel_key INT NOT NULL,
        region_key INT NOT NULL,
        spend DECIMAL(10,2) NOT NULL,
        leads_generated INT NOT NULL,
        impressions INT NOT NULL
    );

    -- HR Employee Fact Table
    CREATE OR REPLACE TABLE hr_employee_fact (
        hr_fact_id INT PRIMARY KEY,
        date DATE NOT NULL,
        employee_key INT NOT NULL,
        department_key INT NOT NULL,
        job_key INT NOT NULL,
        location_key INT NOT NULL,
        salary DECIMAL(10,2) NOT NULL,
        attrition_flag INT NOT NULL
    );

create schema sf_ai_demo.dev;

ALTER SCHEMA sf_ai_demo.dev SET LOG_LEVEL = 'INFO';
ALTER SCHEMA sf_ai_demo.dev SET TRACE_LEVEL = 'ALWAYS';
ALTER SCHEMA sf_ai_demo.dev SET METRIC_LEVEL = 'ALL';

ALTER SCHEMA sf_ai_demo.demo_schema SET LOG_LEVEL = 'INFO';
ALTER SCHEMA sf_ai_demo.demo_schema SET TRACE_LEVEL = 'ALWAYS';
ALTER SCHEMA sf_ai_demo.demo_schema SET METRIC_LEVEL = 'ALL';