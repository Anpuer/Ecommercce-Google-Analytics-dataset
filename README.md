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
**SQL Code** ![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/b308fa05-3254-45fe-8cea-29379df50880)
**Query Result** ![image](https://github.com/Anpuer/Ecommerce-Google-Analytics-dataset/assets/144112015/cb22857d-4439-431d-9e1b-3f1e9c541c46)
