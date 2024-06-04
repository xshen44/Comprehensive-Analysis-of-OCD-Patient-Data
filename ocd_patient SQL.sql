SELECT * FROM ocd_patient.ocd_patient_dataset;

# -- 1. Count of Female vs Male that have OCD & -- Average Obsession Score by Gender
USE ocd_patient;

SELECT Gender, 
	COUNT( `Patient ID`) AS patient_count,
	ROUND(AVG(`Y-BOCS Score (Obsessions)`),2) AS avg_obs_score

FROM ocd_patient_dataset
GROUP BY Gender
ORDER BY patient_count;

# -- 2. Count of Patients by Ethnicity and their respective Average Obsession Score
SELECT 
	COUNT(`Patient ID`)  AS patient_count,
	Ethnicity,
	AVG(`Y-BOCS Score (Obsessions)`) AS avg_obs_score

FROM ocd_patient_dataset
GROUP BY Ethnicity
ORDER BY patient_count;

# -- 3. Number of people diagnosed with OCD MoM

# -- alter table health_data.ocd_patient_dataset
# -- modify `OCD Diagnosis Date` date;
ALTER TABLE ocd_patient_dataset
MODIFY `OCD Diagnosis Date` date;

SELECT 
	COUNT(`Patient ID`) AS patient_count,
    date_format(`OCD Diagnosis Date`, '%Y-%m') AS month
FROM ocd_patient_dataset
GROUP BY month
ORDER BY month;

# -- 4. What is the most common Obsession Type (Count) & it's respective Average Obsession Score
SELECT 
COUNT(`Patient ID`) AS patient_count,
`Obsession Type`,
ROUND(AVG(`Y-BOCS Score (Obsessions)`),2) AS avg_obs_score
FROM ocd_patient_dataset
GROUP BY `Obsession Type`
ORDER BY patient_count;

# -- 5. What is the most common Compulsion type (Count) & it's respective Average Obsession Score
SELECT 
COUNT(`Patient ID`) AS patient_count,
`Compulsion Type`,
ROUND(AVG(`Y-BOCS Score (Obsessions)`),2) AS avg_obs_score
FROM ocd_patient_dataset
GROUP BY `Compulsion Type`
ORDER BY patient_count;
    
    



