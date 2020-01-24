CREATE OR REPLACE TABLE
  `agosto-sandbox-jaredburns`.next2020_transformed.transactions AS
SELECT
  trn.transaction_id,
  trn.cust_id,
  PARSE_DATE('%d-%m-%Y',
    REPLACE(trn.tran_date, '/', '-')) AS tran_date,
  prod.prod_cat,
  prod.prod_subcat,
  trn.Qty,
  trn.Rate,
  trn.Tax,
  trn.total_amt,
  trn.Store_type
FROM
  `agosto-sandbox-jaredburns`.next2020.transactions trn
JOIN
  `agosto-sandbox-jaredburns`.next2020.prod_cat_info prod
ON
  trn.prod_cat_code = prod.prod_cat_code
  AND trn.prod_subcat_code = prod.prod_sub_cat_code
