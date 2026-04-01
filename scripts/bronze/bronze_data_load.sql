-- BULK INSERTION INTO BRONZE LAYER TABLES

TRUNCATE TABLE bronze.crm_cust_info;
-- won't work if the files are in local since postgres server has to have access to the files
COPY bronze.crm_cust_info
FROM 'C:\Users\91944\Documents\DataProjects\DataWarehouse_Layers\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
    FROMAT CSV,
    HEADER TRUE,
    DELIMITER ','
);
SELECT COUNT(*) FROM bronze.crm_cust_info;

TRUNCATE TABLE bronze.crm_prd_info;
COPY bronze.crm_prd_info
FROM 'C:\Users\91944\Documents\DataProjects\DataWarehouse_Layers\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (                 
    FROMAT CSV,
    HEADER TRUE,
    DELIMITER ','
);
SELECT COUNT(*) FROM bronze.crm_prd_info;


TRUNCATE TABLE bronze.crm_sales_details;
COPY bronze.crm_sales_details
FROM 'C:\Users\91944\Documents\DataProjects\DataWarehouse_Layers\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (                 
    FROMAT CSV,
    HEADER TRUE,
    DELIMITER ','
);
SELECT COUNT(*) FROM bronze.crm_sales_details;

TRUNCATE TABLE bronze.erp_cust_az12;
COPY bronze.erp_cust_az12
FROM 'C:\Users\91944\Documents\DataProjects\DataWarehouse_Layers\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH (                 
    FROMAT CSV,
    HEADER TRUE,
    DELIMITER ','
);  
SELECT COUNT(*) FROM bronze.erp_cust_az12;

TRUNCATE TABLE bronze.erp_loc_a101;
COPY bronze.erp_loc_a101
FROM 'C:\Users\91944\Documents\DataProjects\DataWarehouse_Layers\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH (               
    FROMAT CSV,
    HEADER TRUE,
    DELIMITER ','
);
SELECT COUNT(*) FROM bronze.erp_loc_a101;

TRUNCATE TABLE bronze.erp_px_cat_g1v2;
COPY bronze.erp_px_cat_g1v2
FROM 'C:\Users\91944\Documents\DataProjects\DataWarehouse_Layers\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH (                 
    FROMAT CSV,
    HEADER TRUE,
    DELIMITER ','
);
SELECT COUNT(*) FROM bronze.erp_px_cat_g1v2;


-- pg admin pssql terminal
-- \copy bronze.crm_cust_info FROM 'C:\Users\91944\Documents\DataProjects\DataWarehouse_Layers\sql-data-warehouse-project\datasets\source_crm\cust_info.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');
-- \copy bronze.crm_prd_info FROM 'C:\Users\91944\Documents\DataProjects\DataWarehouse_Layers\sql-data-warehouse-project\datasets\source_crm\prd_info.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');
-- \copy bronze.crm_sales_details FROM 'C:\Users\91944\Documents\DataProjects\DataWarehouse_Layers\sql-data-warehouse-project\datasets\source_crm\sales_details.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');
-- \copy bronze.erp_cust_az12 FROM 'C:\Users\91944\Documents\DataProjects\DataWarehouse_Layers\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');
-- \copy bronze.erp_loc_a101 FROM 'C:\Users\91944\Documents\DataProjects\DataWarehouse_Layers\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');
-- \copy bronze.erp_px_cat_g1v2 FROM 'C:\Users\91944\Documents\DataProjects\DataWarehouse_Layers\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv' WITH (FORMAT CSV, HEADER TRUE, DELIMITER ',');


-- Stored Procedures for data loading to bronze layer.
-- CREATE OR REPLACE PROCEDURE bronze.load_bronze()
-- LANGUAGE plpgsql
-- AS $$
-- DECLARE
--     start_time  TIMESTAMP;
--     end_time    TIMESTAMP;
-- BEGIN
--     RAISE NOTICE '=============================';
--     RAISE NOTICE 'Loading Bronze Layer';
--     RAISE NOTICE '=============================';

--     -- Table 1
--     RAISE NOTICE 'Loading bronze.crm_cust_info...';
--     start_time := NOW();
--     TRUNCATE TABLE bronze.crm_cust_info;
--     -- COPY command here
--     end_time := NOW();
--     RAISE NOTICE 'Done in % seconds',
--         EXTRACT(EPOCH FROM (end_time - start_time));

--     -- Table 2
--     RAISE NOTICE 'Loading bronze.crm_prd_info...';
--     start_time := NOW();
--     TRUNCATE TABLE bronze.crm_prd_info;
--     -- COPY command here
--     end_time := NOW();
--     RAISE NOTICE 'Done in % seconds',
--         EXTRACT(EPOCH FROM (end_time - start_time));

--     RAISE NOTICE 'Bronze layer load complete!';

-- EXCEPTION
--     WHEN OTHERS THEN
--         RAISE NOTICE 'Bronze load failed: %', SQLERRM;
-- END;
-- $$;

-- -- run it
-- CALL bronze.load_bronze();