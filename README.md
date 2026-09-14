# Healthcare Insurance Analysis

## Overview

This end-to-end data analytics project investigates the factors that influence patient hospitalisation costs.

The project combines Python, SQL, machine learning and Tableau to clean healthcare data, test business hypotheses, analyse patient and hospital characteristics, predict treatment costs and communicate findings through an interactive dashboard.

## Business Problem

Healthcare insurance providers need reliable cost estimates to support pricing, risk assessment and financial planning.

This analysis explores how factors such as age, BMI, smoking, diabetes, hospital tier, city tier, previous medical conditions and family history affect hospitalisation expenses.

## Project Components

| Component           | Purpose                                              |
| ------------------- | ---------------------------------------------------- |
| Python              | Data cleaning, analysis, visualisation and modelling |
| SQL                 | Database queries and aggregated healthcare reporting |
| Tableau             | Interactive dashboard and data storytelling          |
| Statistical testing | Evaluation of healthcare-related hypotheses          |
| Machine learning    | Prediction of hospitalisation costs                  |

## Analysis Performed

The project includes:

* Combining hospitalisation and medical-examination datasets
* Handling missing values and duplicate records
* Calculating patient age and BMI
* Exploring hospitalisation-cost distributions
* Comparing costs across hospitals and cities
* Analysing smoking, diabetes and heart-related conditions
* Testing statistical hypotheses
* Examining correlations between predictors
* Building healthcare-cost prediction models
* Comparing model performance
* Creating SQL reports
* Designing a Tableau dashboard

## Machine Learning

Two regression models were developed and evaluated:

- Ridge Regression
- Gradient Boosting

### Model Performance

| Model | MAE |
|---|---:|
| Ridge Regression | 2,741.30 |
| Gradient Boosting | 2,078.38 |

Gradient Boosting achieved the lowest MAE and was selected as the
best-performing model for the analysis.

## SQL Analysis

The SQL script answers healthcare business questions such as:

* Average cost by hospital and city tier
* Average characteristics of diabetic patients with heart conditions
* Number of patients with major surgery and cancer history
* Distribution of tier-one hospitals across states
* Patient-level healthcare and demographic summaries

## Dashboard

The Tableau workbook presents major healthcare indicators and comparisons in an interactive format.

The dashboard helps users explore:

* Hospitalisation costs
* Hospital and city tiers
* Medical conditions
* Demographic groups
* Patient-risk factors

## Repository Structure

```text
Healthcare-Insurance-Analysis/
│
├── Report/
│   ├── Data_Science_Capstone.pdf
│   └── Healthcare_Insurance_Analysis.ipynb - Colab.pdf
│
└── Source_code/
    ├── Healthcare_Insurance_Analysis.ipynb
    ├── Data_Science_Capstone.sql
    └── Data_Science_Capstone.twbx
```

## Tools and Technologies

`Python` · `Pandas` · `NumPy` · `Matplotlib` · `Seaborn` · `Scikit-learn` · `XGBoost` · `SQL` · `MySQL` · `Tableau` · `Jupyter Notebook`

## Business Value

The analysis can support insurance providers and healthcare organisations by helping them:

* Estimate expected hospitalisation costs
* Identify significant cost-driving factors
* Compare costs across locations and hospital categories
* Understand patient-risk characteristics
* Improve evidence-based insurance and healthcare planning

## Disclaimer

This project was created for educational and analytical purposes. Its predictions should not be used as a substitute for professional medical, actuarial or insurance decisions.
