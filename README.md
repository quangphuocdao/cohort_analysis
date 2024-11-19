# Cohort Retention Analysis
![image](https://github.com/user-attachments/assets/db9b8fee-fec7-473a-9ad3-598be91ac6f4)

## Overview
In this project, I will analyze an online retail dataset by performing a retention cohort analysis using SQL. A cohort refers to a group of individuals who share a common experience within a defined time period. Cohort Analysis is a powerful method for gaining actionable insights into customer behavior, such as churn rates, product engagement, product value, and other key metrics. This technique is applicable across various domains and technologies, offering strong capabilities for data evaluation.

## Dataset
The data set I will choose from Kaggle. This is a transnational data set which contains all the transactions occurring between 12/2021 and 12/2022 for a UK-based and registered non-store online retail. The company mainly sells unique all-occasion gifts. Many customers of the company are wholesalers.

- InvoiceNo: Unique identifier for each transaction
- StockCode: Product code
- Description: Product Description
- Quantity: Number of items purchased
- InvoiceDate: Date of the transaction
- UnitPrice: Price per unit
- CustomerID: Unique identifier for customers (may contain missing values)
- Country: Country of the customer

## Analytical Focus

### 1. Data Cleaning

Handle missing and invalid data.

Filter out records with negative quantities or unit prices.

Remove duplicate rows.

Store cleaned data in a temporary SQL table.

### 2. Cohort Analysis

Identify each customer's first purchase date (Cohort Date).

Group customers by Cohort Month.

Calculate the Cohort Index, representing the number of months since the first purchase.

### 3. Retention Rate Analysis

Build a cohort table with retention rates for each cohort month.

Pivot data to visualize customer retention trends.

Export Data

