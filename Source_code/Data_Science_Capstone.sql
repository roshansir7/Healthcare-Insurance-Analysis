#Creating Database
CREATE DATABASE healthcare_insurance;

# Using healthcare_insurance as working database
USE healthcare_insurance;

#Checking the tables
SELECT * FROM hospitalisation_details LIMIT 5;
SELECT * FROM medical_examinations LIMIT 5;
SELECT * FROM names LIMIT 5;

#Checking the rows
SELECT COUNT(*) AS hospital_rows FROM hospitalisation_details;
SELECT COUNT(*) AS medical_rows FROM medical_examinations;
SELECT COUNT(*) AS name_rows FROM names;
/*
1. To gain a comprehensive understanding of the factors influencing hospitalization costs
a. Merge the two tables by first identifying the columns in the data tables that will help you in merging
*/

#Ckecking null value
SELECT *
FROM hospitalisation_details
WHERE `Customer ID` IS NULL
   OR `Customer ID` = ''
   OR `Customer ID` = '?';

SELECT *
FROM medical_examinations
WHERE `Customer ID` IS NULL
   OR `Customer ID` = ''
   OR `Customer ID` = '?';
   
#checking duplicate value
SELECT `Customer ID`, COUNT(*) AS total
FROM hospitalisation_details
GROUP BY `Customer ID`
HAVING COUNT(*) > 1;

SELECT `Customer ID`, COUNT(*) AS total
FROM medical_examinations
GROUP BY `Customer ID`
HAVING COUNT(*) > 1;

SET SQL_SAFE_UPDATES = 0;

# Remove null and blank value
DELETE FROM hospitalisation_details
WHERE `Customer ID` IS NULL
   OR TRIM(`Customer ID`) = ''
   OR TRIM(`Customer ID`) = '?';

DELETE FROM medical_examinations
WHERE `Customer ID` IS NULL
   OR TRIM(`Customer ID`) = ''
   OR TRIM(`Customer ID`) = '?';

#Adding primary key
ALTER TABLE hospitalisation_details
MODIFY `Customer ID` VARCHAR(50) NOT NULL;

ALTER TABLE medical_examinations
MODIFY `Customer ID` VARCHAR(50) NOT NULL;

ALTER TABLE hospitalisation_details
ADD PRIMARY KEY (`Customer ID`);

ALTER TABLE medical_examinations
ADD PRIMARY KEY (`Customer ID`);

#Merge both table
SELECT *
FROM hospitalisation_details h
INNER JOIN medical_examinations m
ON h.`Customer ID` = m.`Customer ID`;

#2. Retrieve information about people who are diabetic and have heart problems with their average age, the average number of dependent children, average BMI, and average hospitalization costs
SELECT
    COUNT(*) AS total_people,
    ROUND(AVG(TIMESTAMPDIFF(
        YEAR,
        STR_TO_DATE(CONCAT(h.year, '-', h.month, '-', h.date), '%Y-%b-%d'),
        CURDATE()
    )), 2) AS average_age,
    ROUND(AVG(h.children), 2) AS average_children,
    ROUND(AVG(m.BMI), 2) AS average_BMI,
    ROUND(AVG(h.charges), 2) AS average_hospitalization_cost
FROM hospitalisation_details h
JOIN medical_examinations m
ON h.`Customer ID` = m.`Customer ID`
WHERE m.HBA1C > 6.5
AND LOWER(m.`Heart Issues`) = 'yes';
   
#3. Find the average hospitalization cost for each hospital tier and each city level
SELECT
    h.`Hospital tier`,
    h.`City tier`,
    COUNT(*) AS Total_People,
    ROUND(AVG(CAST(h.charges AS DECIMAL(10,2))), 2) AS Average_Hospitalization_Cost
FROM hospitalisation_details h
GROUP BY h.`Hospital tier`, h.`City tier`
ORDER BY h.`Hospital tier`, h.`City tier`;

#4. Determine the number of people who have had major surgery with a history of cancer
SELECT COUNT(*) AS total_people
FROM medical_examinations
WHERE NumberOfMajorSurgeries > 0
AND LOWER(`Cancer history`) = 'yes';

#5. Determine the number of tier-1 hospitals in each state
SELECT
    `State ID`,
    COUNT(*) AS tier_1_count
FROM hospitalisation_details
WHERE LOWER(`Hospital tier`) = 'tier - 1'
GROUP BY `State ID`;






