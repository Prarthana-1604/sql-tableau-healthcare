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
