#Fact Table

DROP TABLE IF EXISTS dw_fact_contribution_monthly;
DROP TABLE IF EXISTS dw_fact_balance_monthly;

CREATE TABLE dw_fact_contribution_monthly (
  employee_key INT NOT NULL,
  date_key INT NOT NULL,
  employee_contrib_rate DECIMAL(8,3) NULL,
  employee_contrib_amount DECIMAL(14,2) NULL,
  employer_match_amount DECIMAL(14,2) NULL,
  plan_enrolled_flag VARCHAR(10) NULL,
  PRIMARY KEY (employee_key, date_key),
  CONSTRAINT fk_contrib_emp  FOREIGN KEY (employee_key) REFERENCES dw_dim_employee(employee_key),
  CONSTRAINT fk_contrib_date FOREIGN KEY (date_key) REFERENCES dw_dim_date(date_key)
);

CREATE TABLE dw_fact_balance_monthly (
  employee_key INT NOT NULL,
  date_key INT NOT NULL,
  ending_balance DECIMAL(14,2) NULL,
  investment_risk_profile VARCHAR(20) NULL,
  PRIMARY KEY (employee_key, date_key),
  CONSTRAINT fk_bal_emp  FOREIGN KEY (employee_key) REFERENCES dw_dim_employee(employee_key),
  CONSTRAINT fk_bal_date FOREIGN KEY (date_key) REFERENCES dw_dim_date(date_key)
);


#Loading the data

INSERT INTO dw_fact_contribution_monthly
(employee_key, date_key, employee_contrib_rate, employee_contrib_amount, employer_match_amount, plan_enrolled_flag)
SELECT
  e.employee_key,
  d.date_key,
  c.employee_contrib_rate,
  c.employee_contrib_amount,
  c.employer_match_amount,
  c.plan_enrolled_flag
FROM stg_retirement_contrib_raw c
JOIN dw_dim_employee e ON e.employee_id = c.employee_id
JOIN tmp_months_clean mc ON mc.month_raw = c.month_raw
JOIN dw_dim_date d ON d.month_label = mc.month_label;

INSERT INTO dw_fact_balance_monthly
(employee_key, date_key, ending_balance, investment_risk_profile)
SELECT
  e.employee_key,
  d.date_key,
  b.ending_balance,
  b.investment_risk_profile
FROM stg_account_balances_raw b
JOIN dw_dim_employee e ON e.employee_id = b.employee_id
JOIN tmp_months_clean mc ON mc.month_raw = b.month_raw
JOIN dw_dim_date d ON d.month_label = mc.month_label;

SELECT COUNT(*) AS employees_dim FROM dw_dim_employee; #2341
SELECT COUNT(*) AS months_dim FROM dw_dim_date; #60
SELECT COUNT(*) AS contrib_fact FROM dw_fact_contribution_monthly; #18402
SELECT COUNT(*) AS balance_fact FROM dw_fact_balance_monthly; #9965
