# Product / Business Analytics: Users & Revenue

## 📌 Project Overview
This project is an end-to-end **product analytics case study** based on raw e-commerce event data.  
The goal is to analyze **user behavior and revenue performance** using SQL and prepare data for BI visualization.

The project simulates a real-world analytics workflow:
- working with large raw datasets,
- defining business metrics,
- building analytical queries and views,
- preparing a semantic layer for dashboards.

---

## 📊 Dataset
**Source:** Public e-commerce dataset (Kaggle)  
**Data size:** ~9 GB (one month of events)  

The dataset contains user interaction events:
- `view`
- `cart`
- `purchase`

Each row represents a single user event.

---

## 🛠 Tech Stack
- **Database:** PostgreSQL
- **Query Language:** SQL
- **Data Modeling:** raw events table + analytical views
- **BI :** Tableau
- **Environment:** macOS

---

## 🧱 Data Model
Main table: `events`

Key fields:
- `event_time` (timestamptz)
- `event_type` (view, cart, purchase)
- `user_id`
- `product_id`
- `category_id`
- `brand`
- `price`
- `user_session`

Raw data was loaded without mutation.  
All transformations and business logic are implemented via SQL queries and views.

---

## ❓ Business Questions
- How many users interact with the product daily (DAU)?
- How does revenue change over time?
- What is the user conversion rate from view to purchase?
- Where does the biggest drop-off occur in the funnel?
- How much revenue does an average user generate (ARPU)?

---

## 📈 Key Metrics
- **DAU (Daily Active Users)**
- **Total Revenue**
- **Revenue per Day**
- **Conversion Rate (user-level)**
- **ARPU (Average Revenue Per User)**
- **Funnel:** view → cart → purchase

---

## 🧮 Analytical Logic
- Revenue is calculated **only from `purchase` events**.
- Conversion rate is calculated on a **user level**, not event count.
- Raw data is preserved; all cleaning rules are applied through views.
- No artificial deduplication of events was performed.

---

## 🧠 Key Insights (Example)
- Daily revenue shows noticeable variability across the month.
- User conversion rate is approximately **12%**, which is realistic for e-commerce.
- The largest drop-off occurs between `view` and `cart` stages.
- A relatively small share of users generates the majority of revenue.

---

## 📂 Repository Structure
