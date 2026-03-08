# stg_employees_hr_raw

CREATE TABLE stg_employees_hr_raw (
  Age INT NULL,
  Attrition VARCHAR(10) NULL,
  BusinessTravel VARCHAR(50) NULL,
  DailyRate INT NULL,
  Department VARCHAR(100) NULL,
  DistanceFromHome INT NULL,
  Education INT NULL,
  EducationField VARCHAR(100) NULL,
  EmployeeCount INT NULL,
  EmployeeNumber INT NULL,
  EnvironmentSatisfaction INT NULL,
  Gender VARCHAR(20) NULL,
  HourlyRate INT NULL,
  JobInvolvement INT NULL,
  JobLevel INT NULL,
  JobRole VARCHAR(100) NULL,
  JobSatisfaction INT NULL,
  MaritalStatus VARCHAR(50) NULL,
  MonthlyIncome DECIMAL(12,2) NULL,
  MonthlyRate INT NULL,
  NumCompaniesWorked INT NULL,
  Over18 VARCHAR(5) NULL,
  OverTime VARCHAR(10) NULL,
  PercentSalaryHike INT NULL,
  PerformanceRating INT NULL,
  RelationshipSatisfaction INT NULL,
  StandardHours INT NULL,
  StockOptionLevel INT NULL,
  TotalWorkingYears INT NULL,
  TrainingTimesLastYear INT NULL,
  WorkLifeBalance INT NULL,
  YearsAtCompany INT NULL,
  YearsInCurrentRole INT NULL,
  YearsSinceLastPromotion INT NULL,
  YearsWithCurrManager INT NULL,
  employee_id INT NULL,
  _load_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT COUNT(*) FROM stg_employees_hr_raw;
SELECT * FROM stg_employees_hr_raw LIMIT 5;

# stg_retirement_contrib_raw

USE empower_dw;

DROP TABLE IF EXISTS stg_retirement_contrib_raw;
CREATE TABLE stg_retirement_contrib_raw (
  employee_id INT NULL,
  month_raw VARCHAR(20) NULL,
  employee_contrib_rate DECIMAL(8,3) NULL,
  employee_contrib_amount DECIMAL(14,2) NULL,
  employer_match_amount DECIMAL(14,2) NULL,
  plan_enrolled_flag VARCHAR(10) NULL,
  _load_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

#stg_account_balances_raw

DROP TABLE IF EXISTS stg_account_balances_raw;
CREATE TABLE stg_account_balances_raw (
  employee_id INT NULL,
  month_raw VARCHAR(20) NULL,
  ending_balance DECIMAL(14,2) NULL,
  investment_risk_profile VARCHAR(20) NULL,
  _load_ts TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM stg_retirement_contrib_raw limit 5;
SELECT * FROM stg_account_balances_raw limit 5;

