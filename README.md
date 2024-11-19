# Cohort Retention Analysis
![image](https://github.com/user-attachments/assets/db9b8fee-fec7-473a-9ad3-598be91ac6f4)

## Overview
In this project, I will analyze an online retail dataset by performing a retention cohort analysis using SQL. A cohort refers to a group of individuals who share a common experience within a defined time period. Cohort Analysis is a powerful method for gaining actionable insights into customer behavior, such as churn rates, product engagement, product value, and other key metrics. This technique is applicable across various domains and technologies, offering strong capabilities for data evaluation.

## Data Description
The data set I will choose from Kaggle. This is a transnational data set which contains all the transactions occurring between 12/2021 and 12/2022 for a UK-based and registered non-store online retail. The company mainly sells unique all-occasion gifts. Many customers of the company are wholesalers.

- InvoiceNo: Unique identifier for each transaction
- StockCode: Product code
- Description: Product Description
- Quantity: Number of items purchased
- InvoiceDate: Date of the transaction
- UnitPrice: Price per unit
- CustomerID: Unique identifier for customers (may contain missing values)
- Country: Country of the customer

## Process

### 1. Data Cleaning

The first step in the process is data cleaning, which involves handling missing and invalid data to ensure the dataset is reliable for analysis. Records with negative quantities or unit prices are filtered out, as they do not provide meaningful information. Duplicate rows are identified and removed using SQL functions to maintain data integrity. Once the data has been thoroughly cleaned, it is stored in a temporary SQL table for efficient querying and further processing.

### 2. Cohort Analysis

After cleaning the data, we proceed with cohort analysis to understand customer behavior over time. Each customer's first purchase date, known as the Cohort Date, is identified. Customers are then grouped by their Cohort Month, which represents the month of their first transaction. To analyze trends over time, the Cohort Index is calculated, representing the number of months that have elapsed since a customer's first purchase.

### 3. Retention Rate Analysis

The final step involves building a cohort table to calculate retention rates for each cohort month. This is achieved by pivoting the data to visualize how many customers make repeat purchases in subsequent months. The retention trends revealed in this table provide valuable insights into customer loyalty and engagement. To enable further exploration, the cohort data is exported as a CSV file for visualization in tools like Tableau.

## Insights & Recommendation
![image](https://github.com/user-attachments/assets/3f77ef46-292a-461c-bfc0-c6cef2271694)

### 1. Insights:
- There is a significant decline in retention after the first month, with most cohorts experiencing steep drop-offs. For instance, the December 2021 cohort drops to 36.70% in the second month, while newer cohorts like June 2022 and beyond drop even further, showing retention rates below 20% after the second month. This consistent early churn across cohorts highlights a critical need for engagement strategies immediately after a customer's first purchase.

- Older cohorts, such as December 2021, tend to retain customers more effectively over the long term compared to newer cohorts. By the 13th month, the December 2021 cohort retains 26.70% of its customers, while more recent cohorts struggle to maintain retention beyond the 6th month. This difference in retention trends may be tied to seasonality, campaign effectiveness, or changes in product offerings over time.

- Some cohorts exhibit slightly better short-term performance. For instance, the May 2022 cohort has a 19.01% retention rate in its second month, outperforming the April 2022 cohort at 15.11%. Such anomalies suggest that specific marketing campaigns, promotions, or external factors might be influencing customer behavior during these periods, offering opportunities for analysis and replication.

### 2. Recommendation:
- To address the sharp decline in retention after the first month, businesses should prioritize strategies that engage customers early. Implementing loyalty programs, offering discounts for repeat purchases, or sending personalized follow-up emails could encourage customers to make a second purchase. Additionally, improving the onboarding experience for new customers—such as providing educational content or product usage tips—can help maintain their interest and commitment.

- Analyzing high-performing cohorts, such as December 2021, can provide valuable insights into factors contributing to their long-term retention. If seasonal promotions or effective marketing strategies played a role, these can be replicated or adapted for future cohorts. Furthermore, targeted reactivation campaigns aimed at customers who churn after the 5th or 6th month can help recover lost customers, offering them tailored incentives to return.

- To boost retention further, businesses could consider introducing subscription-based models or bundled offerings that encourage repeat engagement. Monitoring recent cohorts and optimizing marketing strategies can also ensure better outcomes for newer customers. Ultimately, combining data-driven cohort insights with proactive customer engagement strategies will enhance overall customer retention and drive long-term success.

