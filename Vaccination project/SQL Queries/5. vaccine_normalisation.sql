CREATE TABLE vaccine(
	vaccine_id SERIAL PRIMARY KEY,
	vaccine_name varchar(20) UNIQUE,
	vaccine_description varchar(150)
);

INSERT INTO VACCINE (vaccine_name, vaccine_description)
SELECT DISTINCT vaccinecode, vaccine_description
FROM VACCINE_SCHEDULE
ON CONFLICT (vaccine_name) DO NOTHING;

ALTER TABLE VACCINE_SCHEDULE
ADD COLUMN vaccine_id INT REFERENCES VACCINE(vaccine_id);

UPDATE VACCINE_SCHEDULE vc
SET vaccine_id = v.vaccine_id
FROM VACCINE v
WHERE vc.vaccinecode = v.vaccine_name;

ALTER TABLE VACCINE_SCHEDULE
DROP COLUMN vaccinecode,
DROP COLUMN vaccine_description;
