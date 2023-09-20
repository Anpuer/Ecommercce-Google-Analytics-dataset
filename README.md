# [SQL] Ecommercce Google Analytics Dataset
## I. Introduction
This is an eCommerce dataset exploration project using SQL on Google BigQuery. The dataset is based on the Google Analytics public dataset and contains data from an eCommerce website.
## II. Requirements
- [Google Cloud Platform account](https://cloud.google.com/free/)
- [Google BigQuery API](https://cloud.google.com/bigquery/docs/enable-transfer-service#:~:text=Enable%20the%20BigQuery%20Data%20Transfer%20Service,-Before%20you%20can&text=Open%20the%20BigQuery%20Data%20Transfer,Click%20the%20ENABLE%20button.) enable
- [SQL query editor](https://cloud.google.com/monitoring/mql/query-editor) or IDE
## III. Dataset access
The Ecommerce dataset is stored in the public Google BigQuery dataset. Follow these steps to access the dataset on Google Big Query:
  1. Sign in to your Google Cloud Platform account and create a new project.
  2. Navigate to the BigQuery dashboard and select your newly created project.
  3. In the navigation panel, select **Add Data** and then select **Search Projects**.
  4. Enter the project ID **bigquery-public-data.google_analytics_sample.ga_sessions** and click **Enter**.
  5. Click on the table **ga_sessions_** to the dataset.
## IV. Exploring the Dataset
Use SQL in Google BigQuery against the Google Analytics data set to write and execute queries to find the desired data for the purpose of answering business questions

### Query 01: calculate total visit, pageview, transaction for Jan, Feb and March 2017 (order by month)
**SQL Code** 

![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/1b1eedf3-6a1b-4a38-9ce0-7f84475e4bd6)

**Query Result** 

![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/413ea46e-2a21-4862-b149-a4afab91f771)

### Query 02: Bounce rate per traffic source in July 2017 (Bounce_rate = num_bounce/total_visit) (order by total_visit DESC)
**SQL Code** 

![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/81b205a3-539c-4e82-b6c3-c5c7fdfb3dd8)

**Query Result** 

![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/8205735a-9788-4da0-a3d5-72faa1e1a2ad)

### Query 03: Revenue by traffic source by week, by month in June 2017
**SQL Code** 

![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/051e4cb6-d7e9-4044-a2cd-947f1df37307)

**Query Result** 

![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/a7c9885d-ec69-44a7-b53c-483f2d25c139)

### Query 04: Average number of pageviews by purchaser type (purchasers vs non-purchasers) in June, July 2017.
**SQL Code** 

![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/7c4c1bd4-d243-4c22-a4bf-0c59842daf17)

**Query Result** 

![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/c00ee71a-0ef4-4230-b768-03b988918802)

### Query 05: Average number of transactions per user that made a purchase in July 2017
**SQL Code** 

![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/63f92b96-473a-4114-957c-76bd081540eb)

**Query Result** 

![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/464d2d33-fb4a-4eeb-bf6f-59a761c356e5)

### Query 06: Average amount of money spent per session. Only include purchaser data in July 2017
**SQL Code** 

![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/da5fd020-66d4-43cd-8570-3a1d81e9878e)

**Query Result** 

![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/82752ae1-6b0f-4c82-9ac4-39bb8e255548)

### Query 07: Other products purchased by customers who purchased product "YouTube Men's Vintage Henley" in July 2017. Output should show product name and the quantity was ordered.
**SQL Code** 

![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/2b648f69-ad26-4c08-9e43-246c23290797)

**Query Result** 

![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/546b6ed7-976d-4ba3-b73d-5a533095c33c)

### Query 08: Calculate cohort map from product view to addtocart to purchase in Jan, Feb and March 2017. For example, 100% product view then 40% add_to_cart and 10% purchase.
**SQL Code** 

![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/c4cd29d0-b666-4d4f-bf5d-96c4125504c3)

**Query Result** 

![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/493354e4-bb51-4211-8931-bdd055c87e48)
