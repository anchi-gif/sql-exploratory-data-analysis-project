# 📊 SQL Exploratory Data Analysis Project

## 📌 Overview

This project performs Exploratory Data Analysis (EDA) and advanced analytical queries using *MySQL* on the *Gold layer* of a previously built data warehouse.

The objective is to analyze business performance, explore key metrics, evaluate trends, segment entities, and generate structured analytical reports using SQL only.

The project follows a progressive structure — starting from basic exploration and moving toward advanced analytical techniques and reporting.

---

## 🗂️ Data Source (Data WareHouse Project)

The analysis is conducted on the *Gold layer views* created in the Data Warehouse project.

Data pipeline structure:

- Bronze Layer → Raw data ingestion  
- Silver Layer → Data cleaning and transformation  
- Gold Layer → Business-ready analytical views  

Only the Gold layer is used in this repository.

Note: Raw datasets are not included in this repository.


---

## 🛠️ Tools & Technologies

- MySQL  
- SQL (CTEs, Window Functions, Aggregations, CASE statements)  
- Git & GitHub  

---

## 📁 Project Structure

### 🔎 01–06: Exploratory Analysis

- *01_data_overview.sql*  
  Initial data inspection and structural exploration.

- *02_dimension_exploration.sql*  
  Exploration of categorical dimensions (e.g., country, category).

- *03_measure_exploration.sql*  
  Analysis of business measures and aggregation levels.

- *04_magnitude_analysis.sql*  
  Evaluation of sales and quantity magnitude across entities.

- *05_ranking_analysis.sql*  
  Ranking dimensions based on aggregated measures.

- *06_window_function_analysis.sql*  
  Advanced insights using window functions.

---

### 📈 07–11: Advanced Analytical Queries

- *07_change_over_time_analysis.sql*  
  Time-based performance trends.

- *08_cumulative_analysis.sql*  
  Running totals and cumulative metrics.

- *09_performance_analysis.sql*  
  Entity-level performance evaluation.

- *10_data_segmentation.sql*  
  Customer and product segmentation using conditional logic.

- *11_part_to_whole_analysis.sql*  
  Contribution analysis (percentage of total metrics).

---

## 📊 Reporting Layer

- *Customer Report*
- *Product Report*

These queries consolidate key business metrics into structured analytical outputs.

---

## 📌 Key SQL Techniques Demonstrated

- Aggregate functions (SUM, AVG, COUNT, MIN, MAX)
- DISTINCT counting
- CASE-based segmentation
- NULL handling (NULLIF)
- Type casting
- Window functions (RANK, ROW_NUMBER, etc.)
- Time-based calculations (TIMESTAMPDIFF)
- Ratio and contribution analysis

---

## 🎯 Project Objectives

- Perform structured exploratory analysis using SQL
- Apply analytical thinking to business data
- Progress from basic exploration to advanced analytics
- Build portfolio-ready SQL projects
- Demonstrate clean query organization and logical progression

---

## 🚀 How to Use

1. Execute files sequentially from 01 to 11.
2. Queries are modular and can be run independently.
3. Reporting queries can be used as analytical views for dashboards or BI tools.

---

- Analytical reasoning progression  
- Structured repository organization  
- Business-oriented metric analysis
