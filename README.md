# Telecom Customer Churn Analysis

An end-to-end data analytics project examining churn behavior across 7,043 telecom customers — from raw data cleaning in **MySQL & Excel**, exploratory analysis in **MySQL**, to an interactive **Power BI** dashboard for business stakeholders.

---

## 📁 Project Structure

```
Telecom-Customer-Churn-Analysis/
│
├── README.md
├── data/
│   └── telecom_churn.csv
├── Mysql/
│   ├── 01_data_quality.sql
│   ├── 02_data_cleaning.sql
│   ├── 03_intermediated_analysis.sql
│   ├── 04_advanced_analysis.sql
├── PowerBi/
│   └── telecom_churn_dashboard.pbix
└── screenshots/
    └── dashboard.png
```

---

## 🎯 Objective

Telecom companies lose significant revenue every year to customer churn. This project identifies **which customer segments churn the most, why, and what it costs the business** — turning a raw dataset into decision-ready insights for retention strategy.

---

## 🛠️ Tools & Workflow

| Stage | Tool | What was done |
|---|---|---|
| Data Quality & Cleaning | MySQL | Checked for nulls, duplicates, inconsistent types; standardized categorical fields; handled blank `TotalCharges` values |
| Exploratory Analysis | MySQL (SQL queries) | Basic → intermediate → advanced queries: churn by segment, cohort-style tenure analysis, revenue-at-risk calculations |
| Visualization | Power BI | Interactive dashboard with KPI cards, churn-rate breakdowns by contract, tenure, payment method, and internet service, with slicers for gender, contract, internet service, and senior citizen status |

---

## 📊 Dashboard Preview

![Dashboard](<img width="1345" height="805" alt="image" src="https://github.com/user-attachments/assets/7e16670a-ed0f-48a2-a091-a9d72cfd88c9" />

)

**Key metrics tracked:** Total Customers, Churn Customers, Churn Rate, Avg Monthly Charge, Yearly Charge — with drill-down by Contract Type, Tenure, Payment Method, and Internet Service.

---

## 💡 Business Insights

1. **Contract type is the single strongest churn driver.** Month-to-month customers churn at **42.71%**, compared to **11.27%** for one-year and just **2.83%** for two-year contracts. Customers without a long-term commitment are over **15x more likely** to leave than those on two-year plans — signaling that contract length, not price alone, is the biggest lever for retention.

2. **Fiber optic customers churn nearly 6x more than DSL-only customers on "No internet."** Fiber optic churn sits at **41.89%** vs. **18.96%** for DSL and **7.40%** for customers with no internet service — suggesting service quality, pricing, or competitive alternatives in the fiber segment need investigation, not just discount-based retention offers.

3. **Electronic check users are the highest-risk payment segment.** Churn among electronic check payers is **45.29%** — nearly 3x higher than mailed check (**19.11%**) and roughly 3x higher than automatic bank transfer (**16.71%**) or credit card (**15.24%**) users. Customers on manual, non-automated payment methods disengage more — pushing customers toward autopay could be a low-cost retention lever.

4. **Churn risk is front-loaded in the customer lifecycle.** The tenure chart shows churn rate is highest in the first ~10–20 months and steadily declines afterward — meaning the first year is the critical retention window; loyalty programs or proactive check-ins in months 1–12 would likely have outsized impact.

5. **Revenue at risk is substantial.** With **1,869 churned customers** and an average monthly charge of **₹64.76**, unmanaged churn represents meaningful recurring revenue loss annually — reinforcing that even a few percentage points of churn reduction on month-to-month/fiber/electronic-check segments would have a measurable bottom-line impact.

**Recommended actions:**
- Prioritize converting month-to-month fiber-optic customers to annual contracts via targeted incentives
- Investigate fiber optic service/pricing complaints as a root cause, not just a symptom
- Encourage autopay adoption among electronic check users
- Front-load retention touchpoints (onboarding, check-ins, offers) within the first 12 months of tenure

---

## 🔗 How to Explore

1. Clone the repo
2. Run SQL scripts in order (`sql/01` → `sql/04`) against `data/telecom_churn.csv` for the cleaning/analysis walkthrough
3. Open `powerbi/telecom_churn_dashboard.pbix` in Power BI Desktop for the interactive dashboard

---

## 👤 Author
[Swati Singh] — Aspiring Data Analyst
[(https://www.linkedin.com/in/swati-singh-insights/)] | [shaluswati109@gmail.com]
