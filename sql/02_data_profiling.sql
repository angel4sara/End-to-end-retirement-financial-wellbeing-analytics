USE empower_dw;

#Row Counts
SELECT 'employees' AS table_name, COUNT(*) AS row_count
FROM stg_employees_hr_raw
UNION ALL
SELECT 'contributions', COUNT(*)
FROM stg_retirement_contrib_raw
UNION ALL
SELECT 'balances', COUNT(*)
FROM stg_account_balances_raw;

#Check duplicate employees
SELECT employee_id, COUNT(*) AS cnt
FROM stg_employees_hr_raw
GROUP BY employee_id
HAVING COUNT(*) > 1;

#Missing value analysis 
SELECT 
SUM(MonthlyIncome IS NULL) AS missing_income,
SUM(JobRole IS NULL) AS missing_jobrole,
SUM(Age IS NULL) AS missing_age
FROM stg_employees_hr_raw;

#Outlier check
SELECT
  MIN(MonthlyIncome) AS min_income,
  MAX(MonthlyIncome) AS max_income,
  AVG(MonthlyIncome) AS avg_income
FROM stg_employees_hr_raw
WHERE MonthlyIncome IS NOT NULL;

#Validate contribution logic
-- Contributions when not enrolled
SELECT COUNT(*) AS contrib_without_enrollment
FROM stg_retirement_contrib_raw
WHERE plan_enrolled_flag = 'No'
  AND employee_contrib_amount > 0;

-- Negative contributions
SELECT COUNT(*) AS negative_contributions
FROM stg_retirement_contrib_raw
WHERE employee_contrib_amount < 0;

#Month format chaos (time-series validation)
SELECT month_raw, COUNT(*) AS cnt
FROM stg_retirement_contrib_raw
GROUP BY month_raw
ORDER BY cnt DESC;

#Duplicate business records (not ID-base)
SELECT
  EmployeeNumber,
  Age,
  JobRole,
  COUNT(*) AS cnt
FROM stg_employees_hr_raw
GROUP BY EmployeeNumber, Age, JobRole
HAVING COUNT(*) > 1;


#Missing critical fields
SELECT
  SUM(MonthlyIncome IS NULL) AS missing_income,
  SUM(JobRole IS NULL) AS missing_jobrole,
  SUM(Age IS NULL) AS missing_age
FROM stg_employees_hr_raw;

#Salary outliers
SELECT
  MIN(MonthlyIncome) AS min_income,
  MAX(MonthlyIncome) AS max_income,
  AVG(MonthlyIncome) AS avg_income
FROM stg_employees_hr_raw
WHERE MonthlyIncome IS NOT NULL;
