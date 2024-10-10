---

# **Repository Overview**

1. **[Dataset](https://github.com/windi-wulandari/PBI-Bank-Muamalat-X-Rakamin/tree/main/dataset)**  
   This is a list of tables used in the project, including the master table.

2. **[EDA_pre-process.sql](https://github.com/windi-wulandari/PBI-Bank-Muamalat-X-Rakamin/blob/main/EDA_pre-process.sql)**  
   This is the query for Exploratory Data Analysis (EDA) and pre-processing, as well as the creation of the master table.

3. **[business_insights.sql](https://github.com/windi-wulandari/PBI-Bank-Muamalat-X-Rakamin/blob/main/business_insights.sql)**  
   This query is used to extract business insights from the available data.

4. **[business_insights_findings.pdf](https://github.com/windi-wulandari/PBI-Bank-Muamalat-X-Rakamin/blob/main/business_insights_findings.pdf)**  
   This document contains insights findings and possible causes.

5. **[recommendation.pdf](https://github.com/windi-wulandari/PBI-Bank-Muamalat-X-Rakamin/blob/main/recommendation.pdf)**  
   This document contains recommendations generated from the previous findings.

6. **[ERD.jpg](https://github.com/windi-wulandari/PBI-Bank-Muamalat-X-Rakamin/blob/main/ERD.jpg)**  
   This Entity Relationship Diagram (ERD) illustrates the database structure, including the relationships between tables, which helps in understanding data flow and relational integrity.

7. **[dashboard_overview.jpg](https://github.com/windi-wulandari/PBI-Bank-Muamalat-X-Rakamin/blob/main/dasboard_overview.jpg)**  
   This image displays an overview of the dashboard, providing a visual summary of the analyzed data.

**Note:** The blue text represents hyperlinks; click to get more detailed information.

---

# Prerequisite

Before starting this project, make sure to log in to the following platforms for tasks such as querying, ERD creation, and dashboard development:

1. **Log in to BigQuery**  
   BigQuery is used for querying data. Ensure you have a Google account and are logged in to BigQuery to start querying data.

2. **Log in to SQLite (Optional)**  
   If you prefer to use SQLite as a local database option, log in to SQLite and set up your environment as needed for this project.

3. **Log in to Lucidchart for ERD Creation**  
   Lucidchart is used to create the Entity Relationship Diagram (ERD) necessary for database design.  
   [Access Lucidchart here](https://www.lucidchart.com/pages/landing?utm_source=google&utm_medium=cpc&utm_campaign=_chart_en_tier3_mixed_search_brand_exact_&km_CPC_CampaignId=1484560207&km_CPC_AdGroupID=60168114191&km_CPC_Keyword=lucidchart&km_CPC_MatchType=e&km_CPC_ExtensionID=&km_CPC_Network=g&km_CPC_AdPosition=&km_CPC_Creative=442433234360&km_CPC_TargetID=kwd-33511936169&km_CPC_Country=9121395&km_CPC_Device=m&km_CPC_placement=&km_CPC_target=&gad_source=1&gclid=CjwKCAjw9p24BhB_EiwA8ID5BncoNb8h85svUHHq2P_Pkxxu1OIwRdj5QADrKv-DDaThecsSz48L3hoClxoQAvD_BwE)

4. **Log in to Google Looker Studio for Dashboard Creation**  
   Looker Studio is used to create dashboards for data visualization.  
   [Access Google Looker Studio here](https://cloud.google.com/looker-studio/?utm_source=google&utm_medium=cpc&utm_campaign=japac-ID-all-en-dr-BKWS-all-all-trial-PHR-dr-1605216&utm_content=text-ad-none-none-DEV_m-CRE_664894245789-ADGP_Hybrid+%7C+BKWS+-+BRO+%7C+Txt+-Data+Analytics-Google+Data+Studio-data+studio-main-KWID_43700077402521123-kwd-300170314731&userloc_9121395-network_g&utm_term=KW_data+studio&gad_source=1&gclid=CjwKCAjw9p24BhB_EiwA8ID5BviwIMikuK88SXeNvOF2m_Zt2Lp40V_xYpZ2xeGEMaxwse6aXhHqSBoCX6EQAvD_BwE&gclsrc=aw.ds&hl=id)

---

# **Problem Statement**
As part of the project-based internship at Bank Muamalat, the interns were assigned the task of analyzing a dataset of technology product sales. Although not directly related to the banking sector, this project aims to enhance data analysis and visualization skills that can be applied across various industries, particularly the tools used directly in cases at Bank Muamalat itself.


----

# **Goal**
To analyze sales data of technology products to obtain valuable business insights and generate strategic recommendations to enhance sales performance and customer satisfaction.

-----

# **Objectives**

1. **Initial Data Exploration (EDA) & Pre-processing**:
   - Understand the structure and characteristics of the dataset.
   - Perform data cleaning and transformation.
   - Create a master table and identify relationships between tables to facilitate comprehensive analysis.

2. **In-depth Analysis for Business Insights**:
   - Analyze overall sales trends.
   - Identify emerging patterns in the sales data.
   - Evaluate the performance of products and product categories.
   - Lay the foundation for business recommendations.

3. **Effective Data Visualization**:
   - Communicate findings and insights through a dashboard.
   - Present an overview of business performance.
   - Create interactive visualizations to facilitate data exploration.

4. **Formulation of Strategic Recommendations**:
   - Based on analytical findings, formulate recommendations to enhance sales performance.
   - Identify opportunities for improving customer satisfaction.
   - Develop strategies for product and category optimization.

----

# **Methodology**
This project will utilize modern data analysis techniques, queries for data processing, and Google Looker Studio for visualization and the creation of executive dashboards. The dashboard will provide an overview of business performance aimed at delivering insights that can be quickly accessed by decision-makers.

**Expected Outcomes:**
- An informative and easily understandable executive dashboard
- Strategic recommendations based on analysis findings
- Enhanced data analysis and visualization skills that can be applied across various industries

----

# **About the Dataset**

This dataset consists of four initial tables: **orders**, **customers**, **products**, and **product_category**. Additionally, there is a **master_table** that consolidates information from these tables. The structure of the relationships among the entities can be seen in the [Entity Relationship Diagram (ERD)](https://github.com/windi-wulandari/PBI-Bank-Muamalat-X-Rakamin/blob/main/ERD.jpg) below:

<div style="text-align: center;">
    <img src="https://drive.google.com/uc?id=1hWyw5BrMCtSvDLu0Hi5kB6ZA8CCkDnbU" alt="Entity Relationship Diagram" width="" height="">
</div>

**Figure 1. Entity Relationship Diagram.**

From Figure 1, it can be explained that the table names have undergone a transformation process, where their columns have been changed to lowercase letters and separated by underscores for better understanding. Below are the details regarding the changes made:

1. **Orders Table:**
   - **Primary Key:** `order_id`
   - **Foreign Key to Master Table:** `order_id`

2. **Customers Table:**
   - **Primary Key:** `customer_id`
   - **Foreign Key to Master Table:** `customer_id`

3. **Products Table:**
   - **Primary Key:** `prod_number`
   - **Foreign Key to Master Table:** `prod_number`
   - **Relationship with Product_Category** through the column `category`

4. **Product_Category Table:**
   - **Primary Key:** `category_id`
   - **Foreign Key to Master Table:** `category_id`

5. **Master Table:**
   - **Primary Key:** `id`
   - **Foreign Keys:** 
     - `order_id` (from Orders)
     - `customer_id` (from Customers)
     - `prod_number` (from Products)
     - `category_id` (from Product_Category)

The Master Table serves as the central table that consolidates information from all the other tables. This allows for comprehensive analysis by linking order data, customer data, product data, and product category data within a single table. The Master Table also includes several additional columns, such as `total_sales`, which is the result of calculations or aggregations from the data in the other tables.

To provide a clearer overview, the following is an explanation of the data types and functions of each column present in the respective tables. This explanation will help in understanding the data structure and the relationships among the tables for further analysis.


**Table 1. Data Types and Explanations**

-----
| Table           | Column               | Data Type | Explanation                                                                 |
|-----------------|----------------------|-----------|------------------------------------------------------------------------------|
| customers       | CustomerID           | INT64     | Unique values representing customers, not for numeric calculations.           |
|                 | FirstName            | STRING    | -                                                                            |
|                 | LastName             | STRING    | -                                                                            |
|                 | CustomerEmail        | STRING    | -                                                                            |
|                 | CustomerPhone        | STRING    | -                                                                            |
|                 | CustomerAddress      | STRING    | -                                                                            |
|                 | CustomerCity         | STRING    | -                                                                            |
|                 | CustomerState        | STRING    | -                                                                            |
|                 | CustomerZip          | INT64     | Categorical, representing postal codes.                                       |
| products        | ProdNumber           | STRING    | -                                                                            |
|                 | ProdName             | STRING    | -                                                                            |
|                 | Category             | INT64     | -                                                                            |
|                 | Price                | FLOAT64   | -                                                                            |
| product_category| CategoryID           | INT64     | Unique identifiers for product categories.                                    |
|                 | CategoryName         | STRING    | -                                                                            |
|                 | CategoryAbbreviation | STRING    | -                                                                            |
| orders          | OrderID              | INT64     | Unique values for orders.                                                    |
|                 | Date                 | STRING    | Needs to be converted to date format.                                         |
|                 | CustomerID           | INT64     | Unique identifiers for customers.                                            |
|                 | ProdNumber           | STRING    | -                                                                            |
|                 | Quantity             | INT64     | Number of items in the order.                                                |
| master_table    | order_date           | DATE      | -                                                                            |
|                 | category_name        | STRING    | -                                                                            |
|                 | product_name         | STRING    | -                                                                            |
|                 | product_price        | REAL      | -                                                                            |
|                 | order_qty            | INT64     | -                                                                            |
|                 | total_sales          | REAL      | -                                                                            |
|                 | cust_email           | STRING    | -                                                                            |
|                 | cust_city            | STRING    | -                                                                            |
|                 | cust_state           | STRING    | -                                                                            |

**Table 2. Column Description**


| Table           | Column             | Description                              |
|-----------------|--------------------|------------------------------------------|
| **customers**    | CustomerID         | Unique customer ID                       |
|                 | FirstName          | Customer's first name                    |
|                 | LastName           | Customer's last name                     |
|                 | CustomerEmail      | Customer's email address                 |
|                 | CustomerPhone      | Customer's phone number                  |
|                 | CustomerAddress    | Customer's full address                  |
|                 | CustomerCity       | Customer's city of residence             |
|                 | CustomerState      | Customer's state of residence            |
|                 | CustomerZip        | Customer's zip code                      |
| **products**     | ProdNumber         | Unique product ID                        |
|                 | ProdName           | Product name                             |
|                 | Category           | Product category                         |
|                 | Price              | Product price                            |
| **product_category** | CategoryID      | Unique category ID                       |
|                 | CategoryName       | Product category name                    |
|                 | CategoryAbbrev     | Product category abbreviation            |
| **orders**       | OrderID           | Unique order ID                          |
|                 | Date               | Order date                               |
|                 | CustomerID         | Customer ID related to the order         |
|                 | ProdNumber         | Product ID related to the order          |
|                 | Quantity           | Quantity of product in the order         |
| **master_table** | order_date         | Order date                               |
|                 | category_name      | Product category name                    |
|                 | product_name       | Product name                             |
|                 | product_price      | Product price                            |
|                 | order_qty          | Quantity of product ordered              |
|                 | total_sales        | Total sales                              |
|                 | cust_email         | Customer email                           |
|                 | cust_city          | Customer city                            |
|                 | cust_state         | Customer state                           |

----

# **Exploratory Data Analysis (EDA) & Pre-Processing**


1. **Query and Attention Related to Table Names**  
   In this repository, queries for this project are already available. However, it should be noted that there may be errors causing differences in table and column names compared to the explanations in this README. Be sure to check carefully to avoid mistakes. Although there are no fatal typographical errors, it is important to ensure the name changes of tables and columns that have been made.

2. **Importance of Including ID, Database, and Schema**  
   In this query, the database or schema that is usually required when using database management systems (DBMS) such as PostgreSQL, BigQuery, SQL Server, DBeaver, and others is not included. For example:


   ```sql
   -- Example query on file EDA_pre-process.sql
   SELECT * 
   FROM customers 
   LIMIT 3; 
   ```

   If you are using BigQuery, you must include the Project ID, dataset, or schema. Here is a more detailed example of the query:

   ```sql
   -- Example query in Big Query
   SELECT * 
   FROM `project_id.dataset.customers` 
   LIMIT 3; 
   ```

   The same applies to other DBMS. If you want to try running the query without adding the database name, dataset, and so on, you can use SQL Lite as a reference. Just upload the dataset and run the exact same query as shown in this file.


3. **EDA and Pre-Processing Stages**  
   The following are the stages carried out in EDA and pre-processing:

   - **Check column & table names:** Checking the names of columns and tables.
   - **Check NULL values:** Checking for NULL values in the dataset.
   - **Check duplicate values:** Checking for duplicate values.
   - **Change data types:** Changing data types as needed.
   - **Create master table:** Creating the master table.

   After these stages, the next step is to conduct business analysis, which will be explained in the following steps, as well as provide recommendations and dashboard visualizations. However, before that, here are the results of EDA and Pre-Processing.

**Table 3. EDA & Pre-Processing**


| Step by Step                 | Table/Column       | Result                                                                                     | Action                                                                                               | Reason                                                                                                                                                   |
|------------------------------|--------------------|--------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| Check column & table names    | All Table & columns| Table and column names are inconsistent, for example, mixing uppercase and lowercase letters and naming with concatenated letters, such as 'OrderID', 'CustomerCity' | Rename tables and columns to be consistent with lowercase letters and separated by underscores (_), for example, OrderID > order_id           | This is an optional option to facilitate code creation and improve readability.                                                                           |
| Check NULL values             | All Table & columns| There are no NULL values                                                                    | -                                                                                                    | -                                                                                                                                                        |
| Check duplicate values        | All Table          | There are no duplicate values                                                               | -                                                                                                    | -                                                                                                                                                        |
| Change data types             | order_date column  | The `order_date` column is detected to have an incorrect data type, which is a string.      | Change the data type of the order_date column to date                                                 | Changing the order_date column from string to date is necessary to ensure the accuracy of date processing, allowing for more precise calculations and facilitating time analysis. |
| Create master table           | master_table       | -                                                                                          | Create the Master Table                                                                              | Facilitating better analysis with a more organized data structure.                                                                                        |

----
# Business Insights Findings

In general, total sales decreased by approximately **21%** from 2020 to 2021, with total sales in 2020 reaching 252,355.38 and 199,286.90 in 2021. The decrease amounted to 53,068.48. Overall, total sales over these two years are 1,754,750.57. This decline indicates that sales performance is unstable and requires attention to boost sales figures in the coming years.

For more details, you can access the PDF file in this repository titled [business_insights_findings](https://github.com/windi-wulandari/PBI-Bank-Muamalat-X-Rakamin/blob/main/business_insights_findings.pdf).

To explore these business insights, you can use two options:
1. Execute the queries available in this repository at [business_insights](https://github.com/windi-wulandari/PBI-Bank-Muamalat-X-Rakamin/blob/main/business_insights.sql).
2. View the visualizations accessible at the link [Google Looker Studio: Sales Dashboard Report](https://lookerstudio.google.com/reporting/d9ad4570-672c-495d-a1ed-b65a0ddf9b17).

Here’s a glimpse of the dashboard:

<div style="text-align: center;">
    <img src="https://drive.google.com/uc?id=1XNzt31F41mc7CIodAhiV8qh9wSzsTgfe" alt="Dashboard Sales Report" width="" height="">
</div>

**Figure 2. Sales Report Dashboard**

--- 

# **Recommendation**

For recommendations, you can access the PDF file in this repository titled [recommendation](https://github.com/windi-wulandari/PBI-Bank-Muamalat-X-Rakamin/blob/main/recommendation.pdf).


---

# **Limitation**

The limitations of this project include the lack of in-depth analysis at the operational level during the Business Insights analysis, leaving many aspects that could be further explored. Additionally, this project did not perform customer segmentation, which represents a significant opportunity for improvement. By applying manual segmentation methods, if a ground truth is established, we can gain a better understanding of customer behavior. For further experimentation, the use of machine learning techniques such as unsupervised learning, like clustering, could provide additional insights into patterns within the data. This would allow for the identification of different customer segments, enabling more targeted marketing strategies and product development.

---


# **References**
1. Chen, H., Chiang, R. H., & Storey, V. C. (2012). Business Intelligence and Analytics: From Big Data to Big Impact. MIS Quarterly, 36(4), 1165-1188.
2. Eckerson, W. W. (2010). Performance Dashboards: Measuring, Monitoring, and Managing Your Business. John Wiley & Sons.
3. Knaflic, C. N. (2015). Storytelling with Data: A Data Visualization Guide for Business Professionals. Wiley.
