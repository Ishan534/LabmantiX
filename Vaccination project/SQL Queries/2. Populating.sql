COPY COVERAGE(GROUP_NAME, CODE, COUNTRY_NAME, YEAR_DATA, ANTIGEN, ANTIGEN_DESCRIPTION, COVERAGE_CATEGORY, CATEGORY_DESCRIPTION, COVERAGE)
FROM 'D:\Workspace\Documents\Job&Internships_Docs\LabmentiX\Vaccination project\Cleaned-data\coverage_CLN.csv' -- path of cleaned data 
DELIMITER ','
CSV HEADER;

COPY INCIDENCE_RATE(GROUP_NAME, CODE,COUNTRY_NAME,YEAR_DATA ,DISEASE ,DISEASE_DESCRIPTION ,DENOMINATOR ,INCIDENCE_RATE ,per_1M_total_pop ,per_1M_under15_pop,per_1k_births)
FROM 'D:\Workspace\Documents\Job&Internships_Docs\LabmentiX\Vaccination project\Cleaned-data\incidence_rate_CLN.csv' -- path of cleaned data 
DELIMITER ','
CSV HEADER;

COPY REPORTED_CASES (GROUP_NAME, CODE, COUNTRY_NAME, YEAR_DATA, DISEASE, DISEASE_DESCRIPTION, CASES)
FROM 'D:\Workspace\Documents\Job&Internships_Docs\LabmentiX\Vaccination project\Cleaned-data\reported_cases_CLN.csv' -- path of cleaned data 
DELIMITER ','
CSV HEADER;

COPY VACCINE_INTRODUCTION (ISO_3_CODE,COUNTRYNAME,WHO_REGION,YEAR_DATA,DESCRIPTION,INTRO,INTRO_NORM)
FROM 'D:\Workspace\Documents\Job&Internships_Docs\LabmentiX\Vaccination project\Cleaned-data\vaccine_introduction_CLN.csv' -- path of cleaned data 
DELIMITER ','
CSV HEADER;

COPY VACCINE_SCHEDULE (ISO_3_CODE, COUNTRYNAME, WHO_REGION, YEAR_DATA, VACCINECODE, VACCINE_DESCRIPTION, SCHEDULEROUNDS, TARGETPOP, TARGETPOP_DESCRIPTION ,GEOAREA ,AGEADMINISTERED ,SOURCECOMMENT)
FROM 'D:\Workspace\Documents\Job&Internships_Docs\LabmentiX\Vaccination project\Cleaned-data\vaccine_schedule_CLN.csv' -- path of cleaned data 
DELIMITER ','
CSV HEADER;
