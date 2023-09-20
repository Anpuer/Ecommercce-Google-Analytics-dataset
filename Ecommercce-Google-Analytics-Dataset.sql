--Q1
SELECT LEFT(date,6) AS month,
       COUNT(totals.visits) AS visits,
       SUM(totals.pageviews) AS pageviews,
       SUM(totals.transactions) AS transactions,
       SUM((totals.totalTransactionRevenue/pow(10,6))) AS revenue
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`
WHERE _table_suffix BETWEEN '0101' AND '0331'
GROUP BY month
ORDER BY month;



--Q2
SELECT DISTINCT trafficSource.source AS source,
       COUNT(totals.visits) AS total_visits,
       COUNT(totals.bounces) AS total_no_of_bounces,
       (COUNT(totals.bounces)/COUNT(totals.visits)*100) AS bounce_rate
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`
GROUP BY source
ORDER BY total_visits DESC;



--Q3
SELECT 'Month' AS time_type,
       format_date('%Y%m', PARSE_DATE('%Y%m%d', date)) AS time,
       trafficSource.source AS source,
       ROUND((SUM(product.productRevenue)/POW(10,6)),4) AS revenue
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201706*`,
  UNNEST (hits) hits,
    UNNEST (hits.product) product
WHERE product.productRevenue IS NOT NULL
GROUP BY time, source
UNION DISTINCT
SELECT 'Week' AS time_type,
       format_date('%Y%W', PARSE_DATE('%Y%m%d', date)) AS time,
       trafficSource.source AS source,
       ROUND((SUM(product.productRevenue)/POW(10,6)),4) AS revenue
FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201706*`,
  UNNEST (hits) hits,
    UNNEST (hits.product) product
WHERE product.productRevenue IS NOT NULL
GROUP BY time, source
ORDER BY revenue DESC;



--Q4
WITH cpurchaser AS
  (SELECT format_date('%Y%m', PARSE_DATE('%Y%m%d', date)) AS month,
        COUNT(DISTINCT fullvisitorId) AS id,
        SUM(totals.pageviews) AS sumpageviews
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`,  
    UNNEST (hits) hits,
      UNNEST (hits.product) product
  WHERE _table_suffix BETWEEN '0601' AND '0731'
    AND totals.totalTransactionRevenue >=1
      AND productRevenue IS NOT NULL
  GROUP BY month),     
cnon_purchaser AS
  (SELECT format_date('%Y%m', PARSE_DATE('%Y%m%d', date)) AS month,
        COUNT(DISTINCT fullvisitorId) AS id,
        SUM(totals.pageviews) AS sumpageviews
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`,  
    UNNEST (hits) hits,
      UNNEST (hits.product) product
  WHERE _table_suffix BETWEEN '0601' AND '0731'
    AND totals.totalTransactionRevenue IS NULL
      AND productRevenue IS NULL
  GROUP BY month)  
SELECT cpurchaser.month,
       (cpurchaser.sumpageviews/cpurchaser.id) AS avg_pageviews_purchase,
       (cnon_purchaser.sumpageviews/cnon_purchaser.id) AS avg_pageviews_non_purchase
FROM cpurchaser
LEFT JOIN cnon_purchaser
USING (month)
ORDER BY month ASC;       



--Q5 
WITH cpurchaser AS
  (SELECT format_date('%Y%m', PARSE_DATE('%Y%m%d', date)) AS month,
        COUNT(DISTINCT fullvisitorId) AS id,
        SUM(totals.transactions) AS totalTransaction
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`,  
    UNNEST (hits) hits,
      UNNEST (hits.product) product
  WHERE totals.totalTransactionRevenue >=1
        AND product.productRevenue IS NOT NULL
  GROUP BY month) 
SELECT cpurchaser.month,
       (cpurchaser.totalTransaction/cpurchaser.id) AS Avg_total_transactions_per_user
FROM cpurchaser;   



--Q6
WITH moneyspent AS
  (SELECT format_date('%Y%m', PARSE_DATE('%Y%m%d', date)) AS month,
        SUM(product.productRevenue) AS totalrevenues,
        SUM(totals.visits	) AS totalvisits
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`,  
    UNNEST (hits) hits,
      UNNEST (hits.product) product
  WHERE totals.totalTransactionRevenue IS NOT NULL
        AND product.productRevenue IS NOT NULL
  GROUP BY month) 
SELECT moneyspent.month,
       ROUND((moneyspent.totalrevenues/moneyspent.totalvisits/POW(10,6)),2) AS avg_revenue_by_user_per_visit
FROM moneyspent; 



--Q7
WITH pYoutube AS
  (SELECT DISTINCT fullVisitorId AS id,
          v2ProductName
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`,  
    UNNEST (hits) hits,
      UNNEST (hits.product) product
  WHERE v2ProductName = "YouTube Men's Vintage Henley"
    AND product.productRevenue IS NOT NULL),
nYoutube AS
  (SELECT DISTINCT fullVisitorId AS id,
          v2ProductName,
          SUM(product.productQuantity) AS nYoutubequantity
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_201707*`,  
    UNNEST (hits) hits,
      UNNEST (hits.product) product
  WHERE v2ProductName <> "YouTube Men's Vintage Henley"
    AND product.productRevenue IS NOT NULL
  GROUP BY 1,2)  
SELECT DISTINCT nYoutube.v2ProductName AS other_purchased_products,
       SUM(nYoutubequantity) AS quantity	
FROM pYoutube
LEFT JOIN nYoutube
ON pYoutube.id = nYoutube.id
GROUP BY other_purchased_products
ORDER BY quantity DESC;



--Q8
WITH c1 AS
  (SELECT format_date('%Y%m', PARSE_DATE('%Y%m%d', date)) AS month,
          COUNT(CASE WHEN eCommerceAction.action_type = '2' THEN 2 END) AS num_product_view,
          COUNT(CASE WHEN eCommerceAction.action_type = '3' THEN 3 END) AS num_addtocart,
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`,  
    UNNEST (hits) hits,
      UNNEST (hits.product) product
  WHERE _table_suffix BETWEEN '0101' AND '0331'
  GROUP BY month),
c2 AS
  (SELECT format_date('%Y%m', PARSE_DATE('%Y%m%d', date)) AS month,  
          COUNT(CASE WHEN eCommerceAction.action_type = '6' THEN 6 END) AS num_purchase
  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_2017*`,  
    UNNEST (hits) hits,
      UNNEST (hits.product) product
  WHERE _table_suffix BETWEEN '0101' AND '0331'
    AND product.productRevenue IS NOT NULL
  GROUP BY month)
SELECT c1.month,  
       c1.num_product_view,
       c1.num_addtocart,
       c2.num_purchase,
       ROUND((c1.num_addtocart/c1.num_product_view*100),2) AS add_to_cart_rate,
       ROUND((c2.num_purchase/c1.num_product_view*100),2) AS purchase_rate
FROM c1
FULL JOIN c2
USING(month)
ORDER BY 1; 

