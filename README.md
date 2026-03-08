## End-to-End Retirement & Financial Wellbeing Analytics

### 1. Data Ingestion & Storage
Synthetic HR, retirement contribution, and account balance datasets were ingested and structured for downstream analysis.

### 2. Data Cleaning & Transformation (SQL,Python)
Python was used for data cleaning, transformation, feature engineering, and preparation of analysis-ready datasets.

### 3. Exploratory Data Analysis (EDA)
EDA was performed to understand contribution behavior, retirement balance growth, demographic patterns, enrollment trends, and segment-level insights.

### 4. Predictive Analytics / Forecasting
Forecasting and scenario analysis were applied to model future retirement balance and contribution trends.

### 5. Business Dashboard (Power BI)
An interactive Power BI dashboard was built to present KPIs, demographic insights, risk segmentation, contribution analysis, retirement readiness, and forecasting outputs.


## Project Summary

This repository showcases an end-to-end analytics project focused on retirement and financial wellbeing, built using synthetic employee HR, contribution, and account balance data. The goal of the project was to simulate how a modern analytics solution can be used to monitor retirement participation, analyze contribution behavior, measure financial readiness, and support future planning through forecasting and scenario analysis.

The project starts with **SQL-based** data ingestion and storage, where raw employee, contribution, and account balance data are loaded into dedicated staging tables. A data profiling layer was then applied to validate row counts, identify duplicates, inspect missing values, detect outliers, and verify contribution-related business rules. This ensured that the data pipeline was both structured and analytically reliable before modeling and reporting. 

To support downstream analytics, the data was modeled into a star schema using dimension and fact tables. Employee and date dimensions were created alongside monthly contribution and balance facts, enabling time-based analysis and employee-level segmentation. The resulting model supports common BI use cases such as demographic analysis, contribution tracking, balance growth analysis, readiness scoring, and cross-filtered reporting by department, job level, age group, and attrition status. 

**Python** was used in the project workflow for cleaning, transformation, and exploratory analysis, helping prepare the data for reporting and support analytical logic such as segmentation and scenario-based thinking. This allowed the project to go beyond simple dashboarding by incorporating a more complete analytics preparation stage.

The **Power BI** report serves as the business-facing layer of the solution and presents the final outputs through a multi-page dashboard. The report covers executive KPIs, retirement balance trends, employee demographics, investment risk segmentation, enrollment analysis, contribution behavior, attrition and retirement readiness, and forecasting/scenario analysis. The final pages help extend the dashboard into forward-looking insights by exploring how balances and readiness may change under different assumptions. 

Overall, this project demonstrates a full end-to-end workflow that combines SQL, Python, and Power BI to deliver a business-focused analytics solution. It highlights skills in data ingestion, data quality validation, dimensional modeling, analytical preparation, dashboard development, and forward-looking scenario analysis in a realistic financial wellbeing use case.
