# 🛍️ Customer Segmentation & Churn Analysis using RFM

![Python](https://img.shields.io/badge/Python-3.10+-blue?logo=python&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-SQLite-lightgrey?logo=sqlite)
![Jupyter](https://img.shields.io/badge/Notebook-Jupyter-orange?logo=jupyter)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![License](https://img.shields.io/badge/License-MIT-yellow)

---

## 📌 Overview

An end-to-end customer analytics project that uses **RFM (Recency, Frequency, Monetary)** analysis to segment customers, identify churn patterns, and generate data-driven re-engagement strategies — built entirely with Python, SQL, and Jupyter Notebook on real retail transaction data.

---

## 🔍 Problem Statement

A UK-based online retailer has **no visibility into which customers are drifting away** and which are worth retaining. The business needs:

- A clear breakdown of customer behavior into actionable segments
- Early identification of at-risk and churned customers
- Targeted strategies to **reduce churn by 15%** and recover at-risk revenue

---

## 📂 Project Structure

```
rfm_churn_project/
│
├── data/
│   ├── Raw/ online_retail.xlsx          # Raw UCI dataset (source)
│   └── Pocessed/ cleaned_retail_data.csv            # Output: cleaned dataset for scored & segmented customers
│
├── notebooks/
│   └── rfm_analysis.ipynb          # Main analysis notebook (end-to-end)
│
├── plots/
│   ├── rfm_score_distribution.png
│   ├── segment_distribution.png
│   ├── revenue_by_segment.png
│   ├── rfm_heatmap.png
│   ├── churn_by_segment.png
│   ├── recency_distribution.png
│   └── frequency_vs_monetary.png
│
├── sql/
│   └── Exploratory SQL Queries.sql
│   └── SQL for RFM Base Table             # All SQL queries used in the project
│
├── requirements.txt
└── README.md
```

---

## 📊 Dataset

| Property | Details |
|---|---|
| **Source** | [UCI Machine Learning Repository — Online Retail](https://archive.ics.uci.edu/ml/datasets/Online+Retail) |
| **Transactions** | 541,909 rows |
| **Customers** | 4,372 unique customers |
| **Period** | December 2010 – December 2011 |
| **Geography** | United Kingdom (primary) + international |

**Schema:**

| Column | Type | Description |
|---|---|---|
| `InvoiceNo` | String | Unique transaction ID (prefix `C` = cancellation) |
| `CustomerID` | String | Unique customer identifier |
| `InvoiceDate` | DateTime | Date and time of transaction |
| `Quantity` | Integer | Units purchased |
| `UnitPrice` | Float | Price per unit (GBP £) |
| `Description` | String | Product name |
| `Country` | String | Customer's country |

---

## 🛠️ Tech Stack

| Tool | Purpose |
|---|---|
| Python 3.10+ | Core language for analysis |
| Pandas, NumPy | Data wrangling and RFM calculations |
| Matplotlib, Seaborn | Data visualization |
| SQLite + SQLAlchemy | SQL-based data extraction |
| Jupyter Notebook | Interactive development environment |

---

## 🔄 Workflow

```
Raw Data (Excel)
      ↓
SQL Extraction & Aggregation (SQLite)
      ↓
Data Cleaning (Pandas) — remove nulls, cancellations, negative values
      ↓
RFM Calculation — Recency / Frequency / Monetary per customer
      ↓
Quintile Scoring — Score each metric 1–5
      ↓
Segmentation — Assign 7 business segments using rule logic
      ↓
Churn Identification — Flag customers inactive > 180 days
      ↓
Visualization — 7 plots covering segments, revenue, and churn
      ↓
Business Recommendations
```

---

## ⚙️ Key Steps

1. **Data Extraction** — Loaded raw Excel data into SQLite; wrote SQL queries to aggregate transactions per customer
2. **Data Cleaning** — Removed ~136K rows: cancelled orders (prefix `C`), missing CustomerIDs, zero/negative quantities and prices
3. **RFM Calculation** — Computed Recency (days since last purchase), Frequency (distinct invoices), Monetary (total spend) per customer
4. **Scoring** — Applied quintile binning (1–5) to each RFM metric; combined into composite RFM score (3–15)
5. **Segmentation** — Assigned customers to 7 segments: Champions, Loyal Customers, Potential Loyalists, New Customers, At-Risk, High-Value Churned, Churned
6. **Churn Analysis** — Defined churn as >180 days of inactivity; calculated churn rate, revenue at risk, and churn rate per segment
7. **Visualization** — Built 7 charts covering score distributions, segment breakdown, revenue heatmap, and churn patterns
8. **Recommendations** — Mapped each segment to a targeted retention or re-engagement action

---

## 📈 Key Findings

> ⚠️ Replace the values below with your actual outputs after running the notebook.

- **Churn Rate:** ~40.90% of customers have not purchased in the last 180 days
- **Revenue at Risk:** ₹2,000,556 from churned customers — 13.7% of total historical revenue
- **Champions** (top 1288 of customers) drive ~9813222.27  of total revenue
- **At-Risk** segment: 550 customers who previously purchased frequently but have gone quiet
- **High-Value Churned**: 238 customers with above-average spend who are now inactive — highest-priority win-back targets
- **New Customers** at highest risk of one-time drop-off without a second-purchase incentive

---

## 💡 Business Recommendations

### 🎯 Strategy to Achieve 15% Churn Reduction

| Segment | Action | Expected Impact |
|---|---|---|
| **At-Risk** | "We miss you" email + 10% limited-time discount | Re-engage 20–30% of segment |
| **High-Value Churned** | Personalized outreach + loyalty credit (5% of past spend) | High revenue per re-activation |
| **New Customers** | Onboarding email sequence (Day 3, 7, 14) + second-purchase offer | Reduce one-and-done drop-off |
| **Champions** | Exclusive loyalty program + early product access | Protect highest-revenue customers |
| **Churned (generic)** | Low-cost mass email only | Low conversion; minimal budget |

**Budget Allocation:**
```
At-Risk:              40%
High-Value Churned:   35%
New Customers:        20%
Generic Churned:       5%
```

---

## 📉 Visualizations

> Screenshots will populate once you run the notebook and save plots to `/plots`.

| Chart | What It Shows |
|---|---|
| `rfm_score_distribution.png` | Distribution of R, F, M scores across all customers |
| `segment_distribution.png` | Count + % of customers per segment |
| `revenue_by_segment.png` | Total revenue contribution by segment |
| `rfm_heatmap.png` | Average spend across Recency × Frequency score grid |
| `churn_by_segment.png` | Churn rate per segment vs. overall churn baseline |
| `recency_distribution.png` | Days-since-purchase histogram: Active vs. Churned |
| `frequency_vs_monetary.png` | Scatter plot of orders vs. spend, colored by segment |

---

## 🚀 How to Run

```bash
# 1. Clone the repository
git clone https://github.com/YOUR_USERNAME/rfm_churn_project.git
cd rfm_churn_project

# 2. (Optional but recommended) Create a virtual environment
python -m venv venv
source venv/bin/activate        # Mac/Linux
venv\Scripts\activate           # Windows

# 3. Install dependencies
pip install -r requirements.txt

# 4. Add the dataset
# Download 'Online Retail.xlsx' from the UCI link above
# Place it inside the /data folder

# 5. Launch the notebook
jupyter notebook notebooks/rfm_analysis.ipynb

# 6. Run all cells top to bottom
# Kernel → Restart & Run All
```

---

## 📦 Requirements

```
pandas>=1.5.0
numpy>=1.23.0
matplotlib>=3.6.0
seaborn>=0.12.0
sqlalchemy>=1.4.0
openpyxl>=3.0.0
scikit-learn>=1.1.0
jupyter>=1.0.0
```

Install all at once:
```bash
pip install -r requirements.txt
```

---

## 🔮 Future Improvements

- [ ] **K-Means Clustering** — Compare ML-based segments vs. rule-based RFM segments
- [ ] **Churn Prediction Model** — Logistic Regression or Random Forest to predict probability of churn per customer
- [ ] **Power BI Dashboard** — Interactive dashboard with KPI cards, segment slicers, and revenue drill-down
- [ ] **Cohort Retention Analysis** — Track how cohorts acquired in each month retain over 12 months
- [ ] **CLV (Customer Lifetime Value)** — Estimate future value per customer to prioritize retention spend
---

## 🙋 Author

**Tushar**
MCA — Tulsiramji Gaikwad-Patil College of Engineering & Technology
Rashtrasant Tukadoji Maharaj Nagpur University

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://linkedin.com/in/tusharparihar07)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black?logo=github)](https://github.com/TusharParihar13)

---

> *"You can't retain customers you can't see. RFM makes the invisible visible."*
