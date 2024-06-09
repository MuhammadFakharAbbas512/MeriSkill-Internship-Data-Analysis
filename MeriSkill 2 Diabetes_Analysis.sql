-- PROJECT TITLE: "Diabetes Patient Analysis
--Analyzing factors associated with diabetes prevalence in patients and summarizing to determine the overall prevalence of diabetes:

-- Total Patients
SELECT COUNT(*) AS Total_Patients
FROM diabetes;

-- Total Patients by Outcome
SELECT
    CASE 
        WHEN Outcome = 1 THEN 'Diabetes'
        ELSE 'No_Diabetes'
    END AS Status,
    COUNT(*) AS Count
FROM diabetes
GROUP BY Status;


--Delving to determine the factors associated with Diabetes by:
-- i. PATIENT DEMOGRAPHY


-- Diabetes prevalence by Gender (Assuming Gender column exists)
SELECT
    Gender,
    COUNT(*) AS Total,
    SUM(CASE WHEN Outcome = 1 THEN 1 ELSE 0 END) AS Diabetes_Count
FROM diabetes
GROUP BY Gender;

-- Diabetes prevalence by Age group
SELECT
    CASE
        WHEN Age BETWEEN 0 AND 20 THEN '0-20'
        WHEN Age BETWEEN 21 AND 40 THEN '21-40'
        WHEN Age BETWEEN 41 AND 60 THEN '41-60'
        ELSE '61+'
    END AS Age_Group,
    COUNT(*) AS Total,
    SUM(CASE WHEN Outcome = 1 THEN 1 ELSE 0 END) AS Diabetes_Count
FROM diabetes
GROUP BY Age_Group
ORDER BY Age_Group;


-- ii. MEDICAL FACTORS

-- Diabetes prevalence by Glucose levels
SELECT
    CASE
        WHEN Glucose < 140 THEN 'Normal'
        WHEN Glucose BETWEEN 140 AND 199 THEN 'Prediabetes'
        ELSE 'Diabetes'
    END AS Glucose_Level,
    COUNT(*) AS Total,
    SUM(CASE WHEN Outcome = 1 THEN 1 ELSE 0 END) AS Diabetes_Count
FROM diabetes
GROUP BY Glucose_Level
ORDER BY Glucose_Level;

-- Diabetes prevalence by BMI
SELECT
    CASE
        WHEN BMI < 18.5 THEN 'Underweight'
        WHEN BMI BETWEEN 18.5 AND 24.9 THEN 'Normal'
        WHEN BMI BETWEEN 25 AND 29.9 THEN 'Overweight'
        ELSE 'Obese'
    END AS BMI_Category,
    COUNT(*) AS Total,
    SUM(CASE WHEN Outcome = 1 THEN 1 ELSE 0 END) AS Diabetes_Count
FROM diabetes
GROUP BY BMI_Category
ORDER BY BMI_Category;

-- iii. OTHER FACTORS


-- Diabetes prevalence by BloodPressure
SELECT
    CASE
        WHEN BloodPressure < 80 THEN 'Normal'
        ELSE 'High'
    END AS BloodPressure_Level,
    COUNT(*) AS Total,
    SUM(CASE WHEN Outcome = 1 THEN 1 ELSE 0 END) AS Diabetes_Count
FROM diabetes
GROUP BY BloodPressure_Level
ORDER BY BloodPressure_Level;

-- Diabetes prevalence by number of Pregnancies
SELECT
    Pregnancies,
    COUNT(*) AS Total,
    SUM(CASE WHEN Outcome = 1 THEN 1 ELSE 0 END) AS Diabetes_Count
FROM diabetes
GROUP BY Pregnancies
ORDER BY Pregnancies;

-- Diabetes prevalence by DiabetesPedigreeFunction (Genetic Risk)
SELECT
    CASE
        WHEN DiabetesPedigreeFunction < 0.5 THEN 'Low Risk'
        ELSE 'High Risk'
    END AS Pedigree_Risk,
    COUNT(*) AS Total,
    SUM(CASE WHEN Outcome = 1 THEN 1 ELSE 0 END) AS Diabetes_Count
FROM diabetes
GROUP BY Pedigree_Risk
ORDER BY Pedigree_Risk;

-- Diabetes prevalence by Insulin levels
SELECT
    CASE
        WHEN Insulin < 16 THEN 'Low'
        WHEN Insulin BETWEEN 16 AND 166 THEN 'Normal'
        ELSE 'High'
    END AS Insulin_Level,
    COUNT(*) AS Total,
    SUM(CASE WHEN Outcome = 1 THEN 1 ELSE 0 END) AS Diabetes_Count
FROM diabetes
GROUP BY Insulin_Level
ORDER BY Insulin_Level;
