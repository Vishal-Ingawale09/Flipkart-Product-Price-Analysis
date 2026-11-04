# Flipkart Product Price & Discount Analytics

An end-to-end data analytics project examining product pricing structures, discount patterns, and market segment distributions across ~20,000 Flipkart e-commerce listings using **Python**, **PostgreSQL**, and **Power BI**.

---

## Project Overview

In the competitive Indian e-commerce landscape, discount depth and price positioning dictate customer acquisition and inventory turnover. This project analyzes catalog pricing strategies to uncover:
- Catalog distribution across custom price tiers (Budget to Premium).
- Categories with aggressive markdown strategies versus margin-retaining segments.
- Sub-category depth and brand concentration.

---

## Tech Stack & Workflow

- **Python (Pandas, NumPy, Matplotlib, Seaborn)**: Data ingestion, handling missing values, extracting hierarchical categories from raw tree strings, feature engineering (`discount_amount`, `discount_percentage`, `price_segment`), and exploratory distribution plots.
- **PostgreSQL**: Relational schema design, bulk CSV ingestion, data validation, and business analytics queries using aggregate functions, subqueries, and window ranking functions (`DENSE_RANK()`, `CTE`).
- **Power BI**: Interactive dashboard design, custom DAX metrics creation, categorical segmentation, and dynamic multi-level filtering.

---

## Project Structure

```text
├── data/
│   ├── flipkart_com-ecommerce_sample.csv   # Raw dataset (~20k records)
│   └── flipkart_cleaned.csv                # Processed and clean dataset
├── notebooks/
│   └── flipkart_price_analysis.ipynb       # Python cleaning, EDA & visualizations
├── sql/
│   └── flipkart_analysis_queries.sql       # Schema setup & 5 business queries
├── dashboard/
│   ├── Flipkart_Analytics_Dashboard.pbix   # Power BI project file
│   └── dashboard_screenshot.png            # Dashboard snapshot
└── README.md
