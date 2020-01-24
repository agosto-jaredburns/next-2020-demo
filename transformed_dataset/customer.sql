CREATE OR REPLACE TABLE
  `agosto-sandbox-jaredburns`.next2020_transformed.customer AS
SELECT
  customer_Id,
  DATE_DIFF(DATE '2020-01-01', PARSE_DATE('%d-%m-%Y',
      DOB), YEAR) AS age,
IF
  (Gender IS NULL,
    'U',
    Gender) AS Gender,
  CAST(city_code AS string) AS city_code
FROM
  `agosto-sandbox-jaredburns`.next2020.customer trans
