# Product / Business Analytics: Users & Revenue

## 📌 Project Overview
This project is an end-to-end **product analytics case study** based on raw e-commerce event data.

The goal of the project is to analyze **user behavior and revenue dynamics** using SQL and to present key product metrics through a BI dashboard.

The workflow follows real-world analytics practice:
- working with large raw datasets,
- validating data quality,
- defining business metrics,
- building analytical SQL logic,
- preparing data for BI visualization,
- documenting assumptions and data limitations.

---

## 📊 Dataset
**Source:** Public e-commerce events dataset (Kaggle)  
**Period:** November 2019  
**Size:** ~9 GB (millions of events)

Each row in the dataset represents a single user interaction event:
- `view`
- `cart`
- `purchase`

---

## 🛠 Tech Stack
- **Database:** PostgreSQL
- **Query Language:** SQL
- **Data Modeling:** Raw events table + analytical views
- **BI Tool:** Tableau
- **Environment:** macOS

---

## 🧱 Data Model
Main table: `events`

Key fields:
- `event_time` (timestamp)
- `event_type` (view, cart, purchase)
- `user_id`
- `product_id`
- `category_id`
- `brand`
- `price`
- `user_session`

Raw data is preserved without modification.  
All business logic and transformations are applied via SQL queries and views.

---

## 🧪 Data Validation & Sanity Checks
Before calculating metrics, basic data quality checks were performed:
- total number of events,
- date range validation,
- distribution of event types,
- verification that revenue is calculated only from `purchase` events.

No artificial deduplication or row removal was applied.

---

## ❓ Business Questions
- How many users interact with the product daily (DAU)?
- How does revenue change over time?
- What percentage of users convert from viewing to purchasing?
- Where does the biggest drop-off occur in the funnel?
- How much revenue does an average user generate (ARPU)?

---

## 📐 Metric Definitions

**DAU (Daily Active Users)**  
Unique users with at least one event per day.

**Total Revenue**  
Sum of `price` for `purchase` events only.

**Revenue per Day**  
Daily aggregation of purchase revenue.

**Conversion Rate**  
Number of users with at least one `purchase`  
divided by number of users with at least one `view`.

**ARPU (Average Revenue Per User)**  
Total revenue divided by number of unique purchasing users.

All conversion metrics are calculated on a **user level**, not event count.

---

## 🔎 Funnel Analysis
The user funnel follows three stages:
1. Product view
2. Add to cart
3. Purchase

Each user is counted once per funnel stage, reflecting real product analytics practice and avoiding event inflation.

---

## ⚠️ Data Anomaly (Important)
On **November 15**, the dataset contains a large volume of user activity events (`view`, `cart`) but **no `purchase` events**.

As a result:
- Revenue drops to zero on this date
- Conversion rate and ARPU also drop to zero
- DAU remains consistent

This anomaly was verified at the raw data level and **intentionally preserved** in the analysis to avoid introducing artificial or misleading values.

---

## 📂 Repository Structure

```
.
├── README.md
├── sql
│   ├── 01_schema.sql
│   ├── 02_indexes.sql
│   ├── 03_sanity_checks.sql
│   ├── 04_core_metrics.sql
│   ├── 05_funnel_analysis.sql
│   └── 06_views.sql
├── dashboards
│   └── screenshots
│       └── tableau_dashboard.png
└── notes
    └── assumptions.md
```
---

## 📊 Dashboard
An analytical dashboard was built in **Tableau** using PostgreSQL as the data source.

The dashboard visualizes:
- Daily Revenue
- Daily Active Users (DAU)
- Conversion Rate
- ARPU

The dashboard is based on a pre-aggregated analytical view (`daily_metrics`),
which serves as a semantic layer and reflects real-world BI best practices.

---

## 🧠 Key Insights
- User activity remains relatively stable throughout the month.
- Conversion rate averages around **12%**, which is realistic for e-commerce.
- A significant anomaly occurs on November 15 due to missing purchase events.
- Revenue and ARPU trends closely follow conversion dynamics.

---

## 🚀 Future Improvements
- Retention and cohort analysis
- Category and brand-level revenue breakdown
- A/B test metric simulation
- Advanced anomaly detection

---

## 👤 Author
Levytskyi Bohdan  
Junior Data Analyst / Product Analytics
