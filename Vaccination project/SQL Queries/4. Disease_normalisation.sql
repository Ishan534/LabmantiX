create table disease(
	disease_id SERIAL PRIMARY KEY,
	disease_name varchar(50) UNIQUE,
	disease_description varchar(50)
);

-- POPULATING DISEASE TABLE USING REPORTED CASES AND INCIDENCE RATE TABLES

INSERT INTO disease(disease_name, disease_description)
SELECT DISTINCT disease, disease_description
FROM incidence_rate
ON CONFLICT (disease_name) DO NOTHING;

INSERT INTO disease(disease_name, disease_description)
SELECT DISTINCT disease, disease_description
FROM reported_cases
ON CONFLICT (disease_name) DO NOTHING;

-- REFRENCING DISEASE TABLE IN REPORTED CASES AND INCIDENCE RATE

ALTER TABLE incidence_rate
ADD COLUMN disease_id INT REFERENCES disease(disease_id);

ALTER TABLE reported_cases
ADD COLUMN disease_id INT REFERENCES disease(disease_id);

-- fill disease_id using disease_name in REPORTED CASES AND INCIDENCE RATE

UPDATE incidence_rate ir
SET disease_id = d.disease_id
FROM disease d
WHERE ir.disease = d.disease_name;

UPDATE reported_cases rc
SET disease_id = d.disease_id
FROM disease d
WHERE rc.disease = d.disease_name;

--DROPING REDUNDAT COLUMNS(DISEASE AND DISEASE_DESCRIPTION) FROM REPORTED CASES AND INCIDENCE RATE

ALTER TABLE reported_cases
DROP COLUMN disease,
DROP COLUMN disease_description;

ALTER TABLE incidence_rate
DROP COLUMN disease,
DROP COLUMN disease_description;

