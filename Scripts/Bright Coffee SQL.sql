SELECT
  *
FROM
  "BRIGHTCOFFEE_SHOP"."PUBLIC"."SALES"
LIMIT
  10;

SELECT *,
  UNIT_PRICE*transaction_qty as TOTAL_AMOUNT,
  CASE
    WHEN transaction_time between '06:00:00'and '07:59:59' THEN '6AM-8AM'
    WHEN transaction_time between '08:00:00'and  '09:59:59' THEN '8AM-10AM'
    WHEN transaction_time between'10:00:00' and '11:59:59' THEN '10AM-12PM'
    WHEN transaction_time between'12:00:00' and  '13:59:59' THEN '12PM-2PM'
    WHEN transaction_time between'14:00:00' and  '15:59:59' THEN '2PM-4PM'
    WHEN transaction_time between'16:00:00' and  '17:59:59' THEN '4PM-6PM'
    WHEN transaction_time between'18:00:00' and '20:59:59' THEN '6PM-9PM'
    ELSE '9PM-6AM'
  END AS Times,
  CASE
    WHEN MONTH(transaction_date) IN (12, 1, 2) THEN 'Summer'
    WHEN MONTH(transaction_date) IN (3, 4, 5) THEN 'Autumn'
    WHEN MONTH(transaction_date) IN (6, 7, 8) THEN 'Winter'
    WHEN MONTH(transaction_date) IN (9, 10, 11) THEN 'Spring'
    ELSE 'Unknown'
  END AS Season
  
FROM "BRIGHTCOFFEE_SHOP"."PUBLIC"."SALES";