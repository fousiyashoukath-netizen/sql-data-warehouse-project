


/*
=================================================================
Quality Checks
=================================================================
*/

--checking  unwanted spaces

SELECT 
cst_firstname 
FROM silver.crm_cust_info
WHERE cst_firstname  != TRIM(cst_firstname );

SELECT 
cst_lastname 
FROM silver.crm_cust_info
WHERE cst_lastname  != TRIM(cst_lastname  );

SELECT
    cst_id ,             
    cst_key    ,         
    TRIM(cst_firstname)    cst_firstname ,  
    TRIM(cst_lastname)  cst_lastname,       
    cst_marital_status ,
    cst_gndr    ,        
    cst_create_date    
    
    FROM silver.crm_cust_info

    
SELECT
    cst_id ,             
    cst_key   
     FROM silver.crm_cust_info
    WHERE cst_key != TRIM(cst_key)

    SELECT 
    DISTINCT cst_marital_status
    FROM silver.crm_cust_info

 SELECT 
NULLIF(sls_order_dt,0) 
FROM bronze.crm_sales_details
WHERE sls_order_dt<=0
OR LEN(sls_order_dt) !=8
OR sls_order_dt >20500101
OR sls_order_dt< 19000101

SELECT DISTINCT
sls_sales ,
sls_quantity,
sls_price 



FROM silver.crm_sales_details
WHERE sls_sales != sls_quantity*sls_price
OR sls_sales IS NULL OR sls_quantity IS NULL OR sls_price IS NULL
OR sls_sales <=0 OR sls_quantity <=0 OR sls_price <=0




-- Check for duplicates id

SELECT 
cst_id,
COUNT(*)
FROM bronze.crm_cust_info
GROUP BY cst_id
HAVING COUNT(*)>1 OR cst_id IS NULL


SELECT * FROM
(
SELECT 
*,
ROW_NUMBER() OVER(PARTITION BY cst_id ORDER BY cst_create_date desc) AS flag_last
FROM bronze.crm_cust_info
)t
WHERE flag_last ! =1 and cst_id = 29466
--WHERE cst_id = 29466



SELECT 
prd_id,
COUNT(*)
FROM silver.crm_prd_info
GROUP BY prd_id
HAVING COUNT(*)>1 OR prd_id IS NULL

SELECT
distinct id from silver.erp_px_cat_giv2

SELECT 
prd_nm
FROM silver.crm_prd_info
WHERE prd_nm  != TRIM(prd_nm );


SELECT 
prd_cost
FROM silver.crm_prd_info
WHERE prd_cost  <0 OR prd_cost IS NULL;

SELECT distinct prd_line from silver.crm_prd_info

SELECT 
*
FROM silver.crm_prd_info
WHERE prd_end_dt < prd_start_dt



SELECT
prd_id,
prd_key,
prd_nm,
prd_start_dt,
prd_end_dt,
LEAD(prd_start_dt) OVER(PARTITION BY prd_key ORDER BY prd_start_dt)-1 AS prd_end_dt_test
FROM bronze.crm_prd_info
WHERE prd_key IN ('AC-HE-HL-U509-R','AC-HE-HL-U509')

select * FROM silver.crm_prd_info


-- checking bronze.erp_cust_az12

SELECT 

CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid,4,LEN(cid))
     ELSE cid
END cid,
CASE WHEN bdate>GETDATE() THEN NULL
     ELSE bdate
END bdate,
  CASE WHEN  UPPER(TRIM (gen)) IN ('F','FEMALE') THEN 'Female' 
       WHEN UPPER(TRIM(gen)) IN ('M','MALE') THEN 'Male' 
       ELSE 'n/a'
END gen
FROM bronze.erp_cust_az12

 /*WHERE CASE WHEN cid LIKE 'NAS%' THEN SUBSTRING(cid,4,LEN(cid))
     ELSE cid
END NOT IN (SELECT DISTINCT cst_key FROM 
  silver.crm_cust_info)*/
  SELECT DISTINCT 
  gen gen_old,
  CASE WHEN  UPPER(TRIM (gen)) IN ('F','FEMALE') THEN 'Female' 
       WHEN UPPER(TRIM(gen)) IN ('M','MALE') THEN 'Male' 
       ELSE 'n/a'
END gen
FROM bronze.erp_cust_az12

-- Checking bronze.erp_loc_a101

SELECT 
REPLACE(cid,'-','') cid,
CASE WHEN TRIM(cntry)='DE' THEN 'Germany'
     WHEN TRIM(cntry) IN('US','USA') THEN 'United States'
     WHEN TRIM(cntry)='' OR cntry IS NULL THEN 'n/a'
     ELSE TRIM(cntry)
END cntry
FROM  bronze.erp_loc_a1_01 


SELECT Distinct cntry FROM silver.erp_loc_a101

--Checking bronze.erp_px_cat_giv2

SELECT
id,
cat,
subcat,
maintenance
FROM bronze.erp_px_cat_giv2

SELECT
cat FROM bronze.erp_px_cat_giv2
WHERE cat!=TRIM(cat)

SELECT DISTINCT cat FROM bronze.erp_px_cat_giv2

SELECT * FROM silver.erp_px_cat_g1v2
