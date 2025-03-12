/*
Stored Procedure: Load Bronze Layer (Source -> Bronze)

Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files.
    The procedure performs the following actions:
    - Truncates the bronze tables before loading data.
    - Loads data from specified CSV files into the bronze tables using the LOAD DATA INFILE command.
    - Captures the duration of each load process and prints the time taken for each step.
    - Handles errors during the process and prints the relevant error messages if any issues occur.

*/

DELIMITER $$

CREATE PROCEDURE bronze_load_bronze()
BEGIN
    DECLARE start_time DATETIME;
    DECLARE end_time DATETIME;
    DECLARE batch_start_time DATETIME;
    DECLARE batch_end_time DATETIME;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    BEGIN
        -- Error Handling: Print the error message
        SELECT 'ERROR OCCURRED DURING LOADING BRONZE LAYER' AS error_message;
        SELECT ERROR_MESSAGE() AS error_details;
    END;

    -- Start of the procedure
    SET batch_start_time = NOW();
    SELECT '================================================' AS Process_Description;
    SELECT 'Loading Bronze Layer' AS Process_Description;
    SELECT '================================================' AS Process_Description;

    -- Loading CRM Tables
    SELECT '------------------------------------------------' AS Process_Description;
    SELECT 'Loading CRM Tables' AS Process_Description;
    SELECT '------------------------------------------------' AS Process_Description;

    -- Load crm_cust_info
    SET start_time = NOW();
    SELECT '>> Truncating Table: crm_cust_info' AS Process_Description;
    TRUNCATE TABLE crm_cust_info;
    SELECT '>> Inserting Data Into: crm_cust_info' AS Process_Description;
    LOAD DATA INFILE '/path/to/file/cust_info.csv'
    INTO TABLE crm_cust_info
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
    SET end_time = NOW();
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS Process_Description;

    -- Load crm_prd_info
    SET start_time = NOW();
    SELECT '>> Truncating Table: crm_prd_info' AS Process_Description;
    TRUNCATE TABLE crm_prd_info;
    SELECT '>> Inserting Data Into: crm_prd_info' AS Process_Description;
    LOAD DATA INFILE '/path/to/your/file/prd_info.csv'
    INTO TABLE crm_prd_info
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
    SET end_time = NOW();
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS Process_Description;

    -- Load crm_sales_details
    SET start_time = NOW();
    SELECT '>> Truncating Table: crm_sales_details' AS Process_Description;
    TRUNCATE TABLE crm_sales_details;
    SELECT '>> Inserting Data Into: crm_sales_details' AS Process_Description;
    LOAD DATA INFILE '/path/to/your/file/sales_details.csv'
    INTO TABLE crm_sales_details
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
    SET end_time = NOW();
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS Process_Description;

    -- Loading ERP Tables
    SELECT '------------------------------------------------' AS Process_Description;
    SELECT 'Loading ERP Tables' AS Process_Description;
    SELECT '------------------------------------------------' AS Process_Description;

    -- Load erp_loc_a101
    SET start_time = NOW();
    SELECT '>> Truncating Table: erp_loc_a101' AS Process_Description;
    TRUNCATE TABLE erp_loc_a101;
    SELECT '>> Inserting Data Into: erp_loc_a101' AS Process_Description;
    LOAD DATA INFILE '/path/to/your/file/loc_a101.csv'
    INTO TABLE erp_loc_a101
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
    SET end_time = NOW();
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS Process_Description;

    -- Load erp_cust_az12
    SET start_time = NOW();
    SELECT '>> Truncating Table: erp_cust_az12' AS Process_Description;
    TRUNCATE TABLE erp_cust_az12;
    SELECT '>> Inserting Data Into: erp_cust_az12' AS Process_Description;
    LOAD DATA INFILE '/path/to/your/file/cust_az12.csv'
    INTO TABLE erp_cust_az12
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
    SET end_time = NOW();
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS Process_Description;

    -- Load erp_px_cat_g1v2
    SET start_time = NOW();
    SELECT '>> Truncating Table: erp_px_cat_g1v2' AS Process_Description;
    TRUNCATE TABLE erp_px_cat_g1v2;
    SELECT '>> Inserting Data Into: erp_px_cat_g1v2' AS Process_Description;
    LOAD DATA INFILE '/path/to/your/file/px_cat_g1v2.csv'
    INTO TABLE erp_px_cat_g1v2
    FIELDS TERMINATED BY ','
    LINES TERMINATED BY '\n'
    IGNORE 1 ROWS;
    SET end_time = NOW();
    SELECT CONCAT('>> Load Duration: ', TIMESTAMPDIFF(SECOND, start_time, end_time), ' seconds') AS Process_Description;

    -- End of batch
    SET batch_end_time = NOW();
    SELECT '==========================================' AS Process_Description;
    SELECT 'Loading Bronze Layer is Completed' AS Process_Description;
    SELECT CONCAT('Total Load Duration: ', TIMESTAMPDIFF(SECOND, batch_start_time, batch_end_time), ' seconds') AS Process_Description;
    SELECT '==========================================' AS Process_Description;

END$$

DELIMITER ;


