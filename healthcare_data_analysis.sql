--View first 10 rows of the dataset
SELECT TOP 10 * FROM healthcare_dataset;

--Count the number of records in the dataset 
SELECT COUNT (*)FROM healthcare_dataset;

-- Find distinct values in a specific column (replace 'column_name' with an actual column name)
SELECT DISTINCT column_name FROM healthcare_dataset;

--Check for NULL values in columns
SELECT
	SUM(CASE WHEN Name IS NULL THEN 1 ELSE 0 END) AS Missing_Names,
	SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS Missing_Age,
	SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Missing_Gender
FROM healthcare_dataset;

--Find min, max, average, and total of numerical columns 
SELECT
	MIN(Age) AS Min_Age,
	MAX(Age) AS Max_Age,
	AVG(Age) AS Avg_Age,
	MIN(Billing_Amount) AS Min_Bill,
	MAX(Billing_Amount) AS Max_Bill,
	AVG(Billing_Amount) AS Avg_Bill
FROM healthcare_dataset;

--Find the most common values
SELECT TOP 10 Hospital, COUNT(*) AS Patient_Count
FROM healthcare_dataset
GROUP BY Hospital
ORDER BY Patient_Count DESC;

--Analyze Gender-wise distribution
SELECT Gender, COUNT(*) AS Count 
FROM healthcare_dataset
GROUP BY Gender

--Analyze patient stays (Admission vs. Discharge Date)
SELECT Name,DATEDIFF(DAY, Date_of_Admission, Discharge_Date) AS Stay_Duration
FROM healthcare_dataset
ORDER BY Stay_Duration DESC;

--Find the Average Billing Amount by Gender
SELECT Gender, AVG(Billing_Amount) AS Avg_Billing
FROM healthcare_dataset
GROUP BY Gender;

--Identifying the most Common Diagnosis
SELECT TOP 5 Medical_Condition, COUNT(*) AS Frequency
FROM healthcare_dataset
GROUP BY Medical_Condition
ORDER BY Frequency DESC;

--Categorizing Patients by Age Groups
SELECT 
    CASE 
        WHEN Age BETWEEN 0 AND 18 THEN 'Children (0-18)'
        WHEN Age BETWEEN 19 AND 40 THEN 'Young Adults (19-40)'
        WHEN Age BETWEEN 41 AND 60 THEN 'Middle Age (41-60)'
        ELSE 'Senior Citizens (60+)'
    END AS Age_Group,
    COUNT(*) AS Patient_Count
FROM healthcare_dataset
GROUP BY 
    CASE 
        WHEN Age BETWEEN 0 AND 18 THEN 'Children (0-18)'
        WHEN Age BETWEEN 19 AND 40 THEN 'Young Adults (19-40)'
        WHEN Age BETWEEN 41 AND 60 THEN 'Middle Age (41-60)'
        ELSE 'Senior Citizens (60+)' 
    END
ORDER BY Patient_Count DESC;

--Hospital with Highest Average Billing
SELECT TOP 1 Hospital, AVG(Billing_Amount) AS Avg_Billing
FROM healthcare_dataset
GROUP BY Hospital
ORDER BY Avg_Billing DESC;

--Finding the month with most admissions
SELECT MONTH(Date_of_Admission) AS Month, COUNT(*) AS Total_Admissions
FROM healthcare_dataset
GROUP BY MONTH(Date_of_Admission)
ORDER BY Total_Admissions DESC;

--Finding patients who stayed more than 10 days
SELECT Name, Hospital, DATEDIFF(DAY, Date_of_Admission, Discharge_Date) AS Stay_Duration
FROM healthcare_dataset
WHERE DATEDIFF(DAY, Date_of_Admission, Discharge_Date) > 10
ORDER BY Stay_Duration DESC;
