# 🏪 Franchise Performance Benchmarking & Outlier Intelligence System

---

## Business Problem

A QSR chain operating 85 franchise outlets across 12 Indian cities has no systematic way to identify which franchisees are structurally underperforming vs. temporarily struggling. Regional managers submit monthly Excel reports. The founder looks at total revenue and feels okay. By the time a franchise fails, Rs 40-80 lakhs of investment is already lost.

**This system detects failure signals 6-8 weeks early, segments outlets by performance tier using unsupervised ML, and produces an intervention priority matrix for the ops team.**

---

## Key Business Questions Answered

- Which outlets are underperforming across multiple KPIs simultaneously - not just revenue?
- Are there distinct performance clusters among franchisees, and what defines each cluster?
- Which KPIs are the strongest predictors of long-term franchise success?
- Which outlets need urgent intervention vs. strategic support vs. recognition?
- What does a benchmark top-tier outlet look like, and how far is each outlet from it?
- How much revenue is being lost to Zomato and Swiggy commissions?
- Does high staff turnover directly hurt revenue and ratings?

---

## Project Architecture
```
franchise-intelligence-system/
│
├── Data/
│   ├── raw/
│   │   ├── outlet_master.csv
│   │   ├── daily_transactions.csv
│   │   ├── monthly_performance.csv
│   │   ├── staff_records.csv
│   │   └── customer_reviews.csv
│   └── processed/
│       ├── outlet_scores.csv
│       └── outlet_scores_final.csv
│
├── Notebooks/
│   ├── 01_data_generation.ipynb
│   ├── 02_postgres_loader.ipynb
│   ├── 03_sql_analysis.ipynb
│   ├── 04_eda_analysis.ipynb
│   ├── 05_ml_clustering_pca.ipynb
│   └── 06_excel_scorecard.ipynb
│
├── Reports/
│   ├── chart_01_performance_overview.png
│   ├── chart_02_revenue_analysis.png
│   ├── chart_03_kpi_heatmap.png
│   ├── chart_04_aggregator_analysis.png
│   ├── chart_05_staff_intelligence.png
│   ├── chart_06_customer_behaviour.png
│   ├── chart_07_peak_hour_heatmap.png
│   ├── chart_08_intervention_matrix.png
│   ├── chart_09_waste_intelligence.png
│   ├── chart_10_leaderboard.png
│   └── Franchise_Intelligence_Scorecard.xlsx
│
├── Dashboard/
│   └── Franchise_Intelligence_System.pbix
│
├── requirements.txt
└── README.md
```

---

## Dataset Overview

| Table | Rows | Columns | Description |
|---|---|---|---|
| outlet_master | 85 | 12 | Static outlet info - city, tier, type, zone |
| daily_transactions | 6,81,949 | 32 | Every order with full cost breakdown |
| monthly_performance | 1,530 | 39 | Aggregated KPIs per outlet per month |
| staff_records | 1,530 | 11 | Monthly staff data per outlet |
| customer_reviews | 28,585 | 11 | Reviews across Zomato, Swiggy, Google |
| outlet_scores_final | 85 | 37 | ML output with clusters and scores |
| **Total** | **7,13,679** | **105** | |

**Data Period:** January 2023 - June 2024 (18 months)
**Geography:** 12 Indian cities across 3 tiers
**Synthetic data generated with realistic business logic, seasonality, and injected anomalies**

---

## Tech Stack

| Layer | Tool | Usage |
|---|---|---|
| Language | Python 3.10 | All analysis and ML |
| Data Manipulation | Pandas, NumPy | Cleaning, transformation, aggregation |
| Database | PostgreSQL 17.6 | Structured storage and SQL analysis |
| SQL Interface | pgAdmin 4 | Query execution and DB management |
| Visualization | Matplotlib, Seaborn, Plotly | 10 analytical chart sets |
| ML - Clustering | Scikit-learn KMeans | Outlet segmentation into 4 tiers |
| ML - Dimensionality | Scikit-learn PCA | 15 KPIs reduced to 2D visualization |
| ML - Validation | Silhouette Score, Elbow Method | Optimal cluster selection |
| Feature Importance | Random Forest Classifier | KPI driver identification |
| Dashboard | Power BI Desktop | 4-page executive dashboard |
| Scorecard | Excel + openpyxl | Franchisee-facing output |
| Environment | Jupyter + VS Code | Development |

---

## Analytical Workflow

### Phase 1 - Data Generation
- Generated 7,13,679 rows across 5 tables using Python
- Built realistic outlet archetypes: star, stable, struggling, critical, new
- Injected seasonality, holiday effects, peak hour patterns
- Modelled aggregator commission structure, waste, staff turnover

### Phase 2 - PostgreSQL Analysis
- Loaded all 5 tables into PostgreSQL with proper schema and foreign keys
- Wrote 15 advanced business SQL queries covering:
  - Revenue leaderboard and benchmarking
  - Aggregator dependency and commission analysis
  - Outlet risk scoring with weighted rule engine
  - Complaint early warning system with rolling averages
  - Staff turnover impact analysis
  - City tier ROI comparison
  - Discount ROI analysis
  - Franchise intervention priority matrix

### Phase 3 - EDA & Visualization
- Built 10 professional chart sets (40+ individual plots)
- KPI heatmap across all 85 outlets
- Peak hour demand heatmap
- Staff intelligence scatter plots with trend lines
- Intervention priority scatter with quadrant analysis

### Phase 4 - Machine Learning
- Feature matrix: 15 KPIs across 4 dimensions
- StandardScaler normalization
- Elbow method + Silhouette analysis for optimal k
- K-Means clustering with k=4 (Silhouette: 0.317)
- PCA reducing 15 dimensions to 2 (explaining 45%+ variance)
- Random Forest feature importance (CV Accuracy: 100%)
- Anomaly detection using Silhouette samples

### Phase 5 - Delivery
- Power BI 4-page executive dashboard with drill-through
- Excel scorecard with conditional formatting for franchise ops team
- Dashboard access: https://drive.google.com/file/d/1q6PTDVbokuLP-me8lzboiizf9BX5Npd9/view?usp=sharing

![PAGE 1 - Executive Overview](https://github.com/MohsinR11/franchise-performance-intelligence-system/blob/main/Dashboard%20Pages/PAGE%201%20-%20Executive%20Overview.png)
![PAGE 2 - Franchise Leaderboard](https://github.com/MohsinR11/franchise-performance-intelligence-system/blob/main/Dashboard%20Pages/PAGE%202%20-%20Franchise%20Leaderboard.png)
![PAGE 3 - Cluster Intelligence](https://github.com/MohsinR11/franchise-performance-intelligence-system/blob/main/Dashboard%20Pages/PAGE%203%20-%20Cluster%20Intelligence.png)
![PAGE 4 - Intervention Priority](https://github.com/MohsinR11/franchise-performance-intelligence-system/blob/main/Dashboard%20Pages/PAGE%204%20-%20Intervention%20Priority.png)

---

## Key Findings

| Finding | Metric |
|---|---|
| Star outlets avg monthly revenue | Rs 3,45,950 |
| Critical outlets avg monthly revenue | Rs 71,877 |
| Revenue gap between Star and Critical | 4.8x |
| Star outlets avg net margin | +18.2% |
| Critical outlets avg net margin | -91.5% |
| Total Zomato + Swiggy commission paid | Rs 5.59 Crore |
| Outlets needing immediate exit/restructure | 9 |
| Correlation: high turnover and revenue loss | Rs 2.1L/month |
| Peak demand slot | Sunday 8 PM |
| Best outlet type by ROI | Highway (-0.2% margin) |
| Waste rate gap: Star vs Critical | 12.9% vs 30.9% |
| Repeat customer gap: Star vs Critical | 56.5% vs 35.1% |

---

## ML Results

### Cluster Summary

| Cluster | Outlets | Avg Score | Avg Revenue | Net Margin | Avg Rating |
|---|---|---|---|---|---|
| A - Star Performers | 25 | 86.3 | Rs 3,45,950 | +18.2% | 4.28 |
| B - Stable Operators | 26 | 63.6 | Rs 2,28,980 | +3.7% | 3.94 |
| C - Needs Improvement | 25 | 38.5 | Rs 1,20,639 | -26.0% | 3.57 |
| D - Critical Risk | 9 | 24.8 | Rs 71,877 | -91.5% | 3.10 |

### Top KPI Drivers (Random Forest Feature Importance)

| Rank | KPI | Importance |
|---|---|---|
| 1 | Waste Rate % | 12.3% |
| 2 | Net Margin % | 12.2% |
| 3 | Complaint Rate % | 11.9% |
| 4 | Upsell Rate % | 11.7% |
| 5 | Repeat Customer % | 11.5% |
| 6 | Avg Rating | 11.3% |

**Key insight: Operational KPIs matter more than revenue KPIs for predicting franchise performance tier.**

---

## Intervention Priority Matrix

| Action | Outlets | Criteria |
|---|---|---|
| IMMEDIATE - Exit or Restructure | 9 | Score < 30 and margin < -20% |
| HIGH - Action Plan Within 1 Month | 22 | Score < 45 and complaint rate > 12% |
| MEDIUM - Monthly Review | 16 | Score < 65 with early warning signals |
| LOW - Replicate Best Practices | 38 | Score >= 65 consistently |

---

## SQL Highlights

15 business queries covering:
```sql
-- Risk scoring with weighted rule engine
CASE
    WHEN avg_net_margin_pct < 0  THEN 25
    WHEN avg_net_margin_pct < 5  THEN 15
    WHEN avg_net_margin_pct < 10 THEN 8
    ELSE 0
END
+
CASE WHEN avg_complaint_rate > 20 THEN 20
     WHEN avg_complaint_rate > 15 THEN 12
     ELSE 0
END AS risk_score
```
```sql
-- Complaint early warning with rolling average
AVG(complaint_rate) OVER (
    PARTITION BY outlet_id
    ORDER BY month_num
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
) AS rolling_3m_complaint_rate
```

---

## How to Run

### 1. Clone the Repository
```bash
git clone https://github.com/yourusername/franchise-performance-intelligence-system.git
cd franchise-performance-intelligence-system
```

### 2. Set Up Virtual Environment
```bash
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
```

### 3. Set Up PostgreSQL
- Create database: `franchise_intelligence`
- Run notebook `02_postgres_loader.ipynb` to load all tables

### 4. Run Notebooks in Order
```
01_data_generation.ipynb      - Generate all datasets
02_postgres_loader.ipynb      - Load into PostgreSQL
03_sql_analysis.ipynb         - Run 15 business queries
04_eda_analysis.ipynb         - Generate all charts
05_ml_clustering_pca.ipynb    - Run ML analysis
06_excel_scorecard.ipynb      - Generate Excel output
```

### 5. Open Dashboard
Open `Dashboard/Franchise_Intelligence_System.pbix` in Power BI Desktop

---

## Business Impact

This system enables a QSR chain to:

- **Detect franchise failure 6-8 weeks early** before revenue decline becomes visible to leadership
- **Save Rs 40-80 lakhs** per failed franchise through early intervention
- **Reduce aggregator dependency** by quantifying the true cost of Zomato/Swiggy commission
- **Prioritise ops team bandwidth** using data-driven intervention matrix instead of gut feel
- **Replicate best practices** from star outlets systematically across the network
- **Justify expansion decisions** using city tier ROI analysis and outlet type benchmarking

---

## Project Structure Notes

- All data is synthetic but generated with realistic Indian QSR business logic
- Outlet archetypes, city tier costs, aggregator commission rates match real industry benchmarks
- Seasonality, holiday effects, and peak hour patterns are based on real QSR demand patterns
- The intervention scoring model is designed to be directly deployable with real POS data

---

## Author

**Mohsin Raza**

Data Analyst | Python | SQL | Power BI | Machine Learning

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-0A66C2?style=for-the-badge&logo=linkedin)](https://www.linkedin.com/in/mohsinraza-data/)

[![Email](https://img.shields.io/badge/Email-Contact-EA4335?style=for-the-badge&logo=gmail&logoColor=white)](mailto:mohsinansari1799@gmail.com)

---

*Built as part of an end-to-end data analytics portfolio targeting entry-level data analyst roles in the Indian market*
