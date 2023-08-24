
USE Project

SELECT *
FROM [HR Data.xlsx - HR data]

--Total No of Employees
SELECT COUNT( DISTINCT emp_no) AS Total_no_of_Employees
FROM [HR Data.xlsx - HR data]

--Attrition count
SELECT Count(Attrition) AS Attrition_Count
FROM [HR Data.xlsx - HR data]
WHERE Attrition = 'Yes'

--Attrition_rate

SELECT COUNT(cf_current_employee) *100.0 / SUM(COUNT(cf_current_employee)) OVER() AS Attrition_rate
FROM [HR Data.xlsx - HR data]
WHERE CF_current_employee = 0
GROUP BY Gender

--Average age

SELECT CAST(SUM(Age)AS DECIMAL(10,2)) / CAST(COUNT( DISTINCT emp_no)AS DECIMAL(10,2)) AS Average_Age
FROM [HR Data.xlsx - HR data]

--Active Employees

SELECT COUNT(CF_current_Employee) AS Active_employees
FROM [HR Data.xlsx - HR data]
WHERE CF_current_Employee = 1

--No of current employees by age group

SELECT COUNT(CF_current_employee) AS Employees_by_Agegroup,Gender,CF_age_band 
FROM [HR Data.xlsx - HR data]
WHERE CF_current_Employee = 1
GROUP BY Gender,CF_age_band
ORDER BY CF_age_band

--Number of employees satisfied by Job role

SELECT  SUM(Job_satisfaction) AS Satisfaction_by_role, Job_Role
FROM [HR Data.xlsx - HR data]
GROUP BY Job_Role
ORDER BY SUM(Job_satisfaction) DESC

--Compare the monthly income by Education and Gender

SELECT SUM(Monthly_income) AS Monthly_Income,Education,Gender
FROM [HR Data.xlsx - HR data]
GROUP BY Education,Gender
ORDER BY SUM(Monthly_income) DESC

--Active employees by department in numbers

SELECT  Department, Count(CF_current_Employee) AS Active_employees
FROM [HR Data.xlsx - HR data]
WHERE CF_current_Employee = 1
GROUP BY Department
ORDER BY Count(CF_current_Employee)

--Active employees by department as percent of the total
SELECT Department, 
       (COUNT(CF_current_Employee) * 100.0 / SUM(COUNT(CF_current_Employee)) OVER()) AS Percentage
FROM [HR Data.xlsx - HR data]
WHERE CF_current_Employee = 1
GROUP BY Department
ORDER BY Percentage DESC;


--Work life balance by marital status and gender

SELECT Gender, Marital_status, SUM(Work_life_balance) AS Totals
FROM [HR Data.xlsx - HR data]
GROUP BY Gender,Marital_status
ORDER BY SUM(Work_life_balance) DESC