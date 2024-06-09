-- PROJECT TITLE: HR Analysis

-- Attrition Rate among employees:


-- Total Employees
SELECT COUNT(employeecount) AS Total_Employee
FROM hr_analysis;

-- Total Employees by Attrition
SELECT
    CASE 
        WHEN Attrition = 'yes' THEN 'Attrition'
        WHEN Attrition = 'no' THEN 'No_Attrition'
    END AS Status,
    COUNT(EmployeeCount) AS Rate
FROM hr_analysis
GROUP BY Status;

-- Delving to determine the ranges and determinants of Attrition by:
-- i. EMPLOYEE DEMOGRAPHY

-- Attrition summary by Gender
SELECT
    Gender AS Gender_segment,
    COUNT(attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Gender_segment;

-- Attrition summary by Marital_Status and Gender
SELECT
    MaritalStatus AS Marital_Status,
    Gender,
    COUNT(attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Marital_Status, Gender;

-- Attrition summary by Age
SELECT
    CASE
        WHEN age BETWEEN 18 AND 30 THEN '18-30'
        WHEN age BETWEEN 31 AND 45 THEN '31-45'
        WHEN age BETWEEN 46 AND 60 THEN '46-60'
    END AS Age_Category,
    COUNT(attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Age_Category
ORDER BY Age_Category;

-- Attrition summary by Education_Field
SELECT
    EducationField AS Education_Field,
    COUNT(attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Education_Field
ORDER BY Attrition_rate DESC;



-- ii. JOB DUTY

-- Attrition summary by Department
SELECT
    Department,
    COUNT(Attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Department
ORDER BY Attrition_rate DESC;

-- Attrition summary by Job_Role
SELECT
    JobRole AS Job_Role,
    COUNT(Attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Job_Role
ORDER BY Attrition_rate DESC;

-- Attrition summary by Job_Level
SELECT
    CASE 
        WHEN JobLevel = 1 THEN 'Entry Level'
        WHEN JobLevel = 2 THEN 'Junior or Associate'
        WHEN JobLevel = 3 THEN 'Mid level Specialist'
        WHEN JobLevel = 4 THEN 'Senior'
        WHEN JobLevel = 5 THEN 'Executive'
    END AS Job_Level,
    COUNT(Attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Job_Level
ORDER BY Job_Level;

-- Attrition summary by Year_in_Current_Role and Department
SELECT
    YearsInCurrentRole AS Years_In_Current_Role,
    Department,
    COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Years_In_Current_Role, Department
ORDER BY Years_In_Current_Role;



-- iii. EMPLOYEE ENGAGEMENT

-- Attrition summary by Performance_Rating
SELECT
    CASE
        WHEN PerformanceRating = 3 THEN 'Low'
        WHEN PerformanceRating = 4 THEN 'High'
    END AS Performance_Rating,
    COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Performance_Rating;

-- Attrition summary by Work_Life_Balance
SELECT 
    CASE
        WHEN WorkLifeBalance = 1 THEN '1..Bad'
        WHEN WorkLifeBalance = 2 THEN '2..Average'
        WHEN WorkLifeBalance = 3 THEN '3..Good'
        WHEN WorkLifeBalance = 4 THEN '4..Excellent'
    END AS Work_Life_Balance,
    COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Work_Life_Balance
ORDER BY Work_Life_Balance;

-- Attrition summary by Overtime
SELECT 
    Overtime,
    COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Overtime;

-- Attrition summary by Job_Involvement
SELECT
    CASE 
        WHEN JobInvolvement = 1 THEN '1..Very_Low'
        WHEN JobInvolvement = 2 THEN '2..Low'
        WHEN JobInvolvement = 3 THEN '3..Moderate'
        WHEN JobInvolvement = 4 THEN '4..High'
    END AS Job_Involvement_Rank,
    COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Job_Involvement_Rank
ORDER BY Job_Involvement_Rank;

-- Attrition summary by Distance_From_Home
SELECT
    CASE
        WHEN DistanceFromHome BETWEEN 1 AND 10 THEN 'Near'
        WHEN DistanceFromHome BETWEEN 10 AND 20 THEN 'Far'
        WHEN DistanceFromHome BETWEEN 20 AND 30 THEN 'Very_Far'
    END AS Distance_From_Home,
    COUNT(Attrition) AS Attrition_Rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Distance_From_Home
ORDER BY Attrition_Rate DESC;


-- iv. ORGANIZATION FACTORS


-- Attrition summary by Job_Satisfaction
SELECT
    CASE
        WHEN JobSatisfaction = 1 THEN '1..Very_Dissatisfied'
        WHEN JobSatisfaction = 2 THEN '2..Dissatisfied'
        WHEN JobSatisfaction = 3 THEN '3..Satisfied'
        WHEN JobSatisfaction = 4 THEN '4..Very_Satisfied'
    END AS Job_Satisfaction_Rank,
    COUNT(Attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Job_Satisfaction_Rank
ORDER BY Job_Satisfaction_Rank;

-- Attrition summary by Environmental_Satisfaction
SELECT
    CASE
        WHEN EnvironmentSatisfaction = 1 THEN '1..Very_Dissatisfied'
        WHEN EnvironmentSatisfaction = 2 THEN '2..Dissatisfied'
        WHEN EnvironmentSatisfaction = 3 THEN '3..Satisfied'
        WHEN EnvironmentSatisfaction = 4 THEN '4..Very_Satisfied'
    END AS Environmental_Satisfaction_Rank,
    COUNT(Attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Environmental_Satisfaction_Rank
ORDER BY Environmental_Satisfaction_Rank;

-- Attrition summary by Relationship_Satisfaction
SELECT
    CASE 
        WHEN RelationshipSatisfaction = 1 THEN '1..Very_Dissatisfied'
        WHEN RelationshipSatisfaction = 2 THEN '2..Dissatisfied'
        WHEN RelationshipSatisfaction = 3 THEN '3..Satisfied'
        WHEN RelationshipSatisfaction = 4 THEN '4..Very_Satisfied'
    END AS Relationship_Satisfaction_Rank,
    COUNT(Attrition) AS Attrition_rate
FROM hr_analysis
WHERE Attrition = 'yes'
GROUP BY Relationship_Satisfaction_Rank
ORDER BY Relationship_Satisfaction_Rank;
