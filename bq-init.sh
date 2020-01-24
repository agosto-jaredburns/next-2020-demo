bq --location=US mk \
--dataset \
--description 'Data loaded from Kaggle (https://www.kaggle.com/amark720/retail-shop-case-study-dataset#)' \
agosto-sandbox-jaredburns:next2020

bq --location=US mk \
--dataset \
--description 'Data transformed from Kaggle (https://www.kaggle.com/amark720/retail-shop-case-study-dataset#)' \
agosto-sandbox-jaredburns:next2020_transformed

bq --location=US load \
--replace \
--source_format=CSV \
--skip_leading_rows=1 \
next2020.customer \
gs://next-2020-jb/Customer.csv \
customer_Id:NUMERIC,DOB:STRING,Gender:STRING,city_code:INTEGER

bq --location=US load \
--replace \
--source_format=CSV \
--skip_leading_rows=1 \
next2020.transactions \
gs://next-2020-jb/Transactions.csv \
transaction_id:NUMERIC,cust_id:NUMERIC,tran_date:STRING,prod_subcat_code:INTEGER,prod_cat_code:INTEGER,Qty:NUMERIC,Rate:NUMERIC,Tax:FLOAT,total_amt:FLOAT,Store_type:STRING

bq --location=US load \
--replace \
--source_format=CSV \
--skip_leading_rows=1 \
next2020.prod_cat_info \
gs://next-2020-jb/prod_cat_info.csv \
prod_cat_code:INTEGER,prod_cat:STRING,prod_sub_cat_code:INTEGER,prod_subcat:STRING
