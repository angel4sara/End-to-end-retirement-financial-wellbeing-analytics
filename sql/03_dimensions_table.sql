#dw_dim_employee

DROP TABLE IF EXISTS dw_dim_employee;

CREATE TABLE dw_dim_employee (
  employee_key INT AUTO_INCREMENT PRIMARY KEY,
  employee_id INT NOT NULL,
  age INT NULL,
  gender VARCHAR(20) NULL,
  department VARCHAR(100) NULL,
  job_role VARCHAR(100) NULL,
  job_level INT NULL,
  monthly_income DECIMAL(12,2) NULL,
  attrition VARCHAR(10) NULL,
  UNIQUE KEY uk_employee_id (employee_id)
);
INSERT INTO dw_dim_employee (
  employee_id,
  age,
  gender,
  department,
  job_role,
  job_level,
  monthly_income,
  attrition
)
SELECT DISTINCT
  employee_id,
  Age,
  Gender,
  Department,
  JobRole,
  JobLevel,
  MonthlyIncome,
  Attrition
FROM stg_employees_hr_raw
WHERE employee_id IS NOT NULL;

SELECT * FROM dw_dim_employee LIMIT 5;

#dw_dim_date
USE empower_dw;

DROP TABLE IF EXISTS dw_dim_date;

CREATE TABLE dw_dim_date (
  date_key INT AUTO_INCREMENT PRIMARY KEY,
  month_start DATE NOT NULL,
  year_num INT NOT NULL,
  month_num INT NOT NULL,
  month_label CHAR(7) NOT NULL,  -- 'YYYY-MM'
  UNIQUE KEY uk_month_label (month_label)
);

DROP TEMPORARY TABLE IF EXISTS tmp_months_clean;

CREATE TEMPORARY TABLE tmp_months_clean AS
SELECT DISTINCT
  month_raw,
  CASE
    WHEN month_raw REGEXP '^[0-9]{4}-[0-9]{2}$' THEN month_raw
    WHEN month_raw REGEXP '^[0-9]{4}/[0-9]{2}$' THEN REPLACE(month_raw,'/','-')
    WHEN month_raw REGEXP '^[0-9]{2}/[0-9]{4}$' THEN CONCAT(SUBSTRING(month_raw,4,4),'-',SUBSTRING(month_raw,1,2))
    ELSE NULL
  END AS month_label
FROM (
  SELECT month_raw FROM stg_retirement_contrib_raw
  UNION ALL
  SELECT month_raw FROM stg_account_balances_raw
) x
WHERE month_raw IS NOT NULL;

INSERT IGNORE INTO dw_dim_date (month_start, year_num, month_num, month_label)
SELECT
  STR_TO_DATE(CONCAT(month_label,'-01'), '%Y-%m-%d') AS month_start,
  CAST(SUBSTRING(month_label,1,4) AS UNSIGNED) AS year_num,
  CAST(SUBSTRING(month_label,6,2) AS UNSIGNED) AS month_num,
  month_label
FROM tmp_months_clean
WHERE month_label IS NOT NULL;

SELECT COUNT(*) AS months_loaded FROM dw_dim_date;
SELECT * FROM dw_dim_date ORDER BY month_start LIMIT 5;
SELECT * FROM dw_dim_date ORDER BY month_start DESC LIMIT 5;


