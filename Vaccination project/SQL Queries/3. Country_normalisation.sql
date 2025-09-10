-- Country table will we used to store unique values of group_name, iso_code, countryname of all the tables
-- (Coverage, incidence_rate, vaccine_introduction, vaccine_schedule, reported_case) 

CREATE TABLE COUNTRY (
    country_id SERIAL PRIMARY KEY,
    group_name VARCHAR(50),
    iso_code VARCHAR(50) UNIQUE,
    countryname VARCHAR(100)
);

-- from coverge
Insert into COUNTRY (group_name,iso_code,countryname)
SELECT DISTINCT group_name, code, country_name
FROM COVERAGE
ON CONFLICT (iso_code) Do NOTHING;

-- from incidence_rate
insert into country(group_name, iso_code, countryname)
select distinct group_name, code, country_name
from incidence_rate
on conflict (iso_code) do nothing;

-- from reported_cases
insert into country(group_name, iso_code, countryname)
select distinct group_name, code, country_name
from reported_cases
on conflict (iso_code) do nothing;

-- from vaccine_introduction
insert into country(group_name, iso_code, countryname)
select distinct 'WHO_REGIONS' as group_name, iso_3_code, countryname
from vaccine_introduction
on conflict (iso_code) do nothing;

-- from vaccine_schedule
insert into country(group_name, iso_code, countryname)
select distinct 'WHO_REGIONS' as group_name, iso_3_code, countryname
from vaccine_schedule
on conflict (iso_code) do nothing;


-- REFRENCING THE COUNTRY TABLE WITH OTHER TABLES

-- 1. COVERAGE
ALTER TABLE COVERAGE
ADD COLUMN country_id INT REFERENCES COUNTRY(country_id);

-- 2. INCIDENCE RATE
ALTER TABLE INCIDENCE_RATE
ADD COLUMN country_id INT REFERENCES COUNTRY(country_id);

-- 3. REPORTED CASES
ALTER TABLE REPORTED_CASES
ADD COLUMN country_id INT REFERENCES COUNTRY(country_id);

-- 4. VACCINE INTRODUCTION
ALTER TABLE VACCINE_INTRODUCTION
ADD COLUMN country_id INT REFERENCES COUNTRY(country_id);

-- 5. VACCINE SCHEDULE
ALTER TABLE VACCINE_SCHEDULE
ADD COLUMN country_id INT REFERENCES COUNTRY(country_id);



-- “map” the ISO code in each fact table to the corresponding country_id in COUNTRY.

-- 1. for COVERAGE:
UPDATE COVERAGE cv
SET country_id = c.country_id
FROM COUNTRY c
WHERE cv.code = c.iso_code;

-- 2. FOR INCIDENCE RATE:
UPDATE INCIDENCE_RATE ir
SET country_id = c.country_id
FROM COUNTRY c
WHERE ir.code = c.iso_code;

-- 3 FOR REPORTED CASES 
UPDATE REPORTED_CASES rc
SET country_id = c.country_id
FROM COUNTRY c
WHERE rc.code = c.iso_code;

-- 4 VACCINE INTRODUCTION
UPDATE VACCINE_INTRODUCTION vi
SET country_id = c.country_id
FROM COUNTRY c
WHERE vi.iso_3_code = c.iso_code;

-- 5. VACCINE SCHEDULE
UPDATE VACCINE_SCHEDULE vs
SET country_id = c.country_id
FROM COUNTRY c
WHERE vs.iso_3_code = c.iso_code;


-- DROPPING REDUNDANT COLUMNS 

-- 1. COVERAGE
ALTER TABLE COVERAGE
DROP group_name,
DROP code;

-- 2. INCIDENCE RATE
ALTER TABLE INCIDENCE_RATE
DROP group_name,
DROP code,
DROP country_name;

-- 3. REPORTED CASES
ALTER TABLE REPORTED_CASES
DROP group_name,
DROP code,
DROP country_name;

-- 4. VACCINE INTRODUCTION
ALTER TABLE  VACCINE_INTRODUCTION
DROP iso_3_code,
DROP countryname;

-- 5. VACCINE SCHEDULE
ALTER TABLE VACCINE_SCHEDULE
DROP iso_3_code,
DROP countryname;







