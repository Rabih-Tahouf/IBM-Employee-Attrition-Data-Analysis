#Job Involvement

create view j1 as
SELECT JOB_INVOLVEMENT_RATE, COUNT(EMPLOYEE_ID) NUM_OF_attrition FROM IBM_JOB_INVOLVE A, IBM_EMPLOYEE B
WHERE A.JOB_INVOLVEMENT_ID=B.JOB_INVOLVEMENT_ID
and attrition='Yes'
GROUP BY JOB_INVOLVEMENT_RATE

create view j2 as
SELECT JOB_INVOLVEMENT_RATE, COUNT(EMPLOYEE_ID) NUM_OF_remain FROM IBM_JOB_INVOLVE A, IBM_EMPLOYEE B
WHERE A.JOB_INVOLVEMENT_ID=B.JOB_INVOLVEMENT_ID
and attrition='No'
GROUP BY JOB_INVOLVEMENT_RATE

CREATE VIEW JOB_INVOLVEMENT AS
SELECT j1.JOB_INVOLVEMENT_RATE,NUM_OF_attrition,NUM_OF_remain, NUM_OF_attrition/(NUM_OF_attrition+NUM_OF_remain) attrition_RATE,
RANK() OVER ( ORDER BY NUM_OF_attrition/(NUM_OF_attrition+NUM_OF_remain)desc ) ranking
FROM j1,j2
WHERE j1.JOB_INVOLVEMENT_RATE=j2.JOB_INVOLVEMENT_RATE

select * from JOB_INVOLVEMENT

select max(attrition_rate)-min(attrition_rate) difference1 from JOB_INVOLVEMENT

#Education Level:

create view E1 AS
SELECT education_level, COUNT(EMPLOYEE_ID) NUM_OF_attrition FROM IBM_education A, IBM_EMPLOYEE B
WHERE A.education_ID=B.education_ID and attrition='Yes'
GROUP BY education_level

CREATE VIEW E2 AS
SELECT education_level, COUNT(EMPLOYEE_ID) NUM_OF_remain
 
FROM IBM_education A, IBM_EMPLOYEE B WHERE A.education_ID=B.education_ID and attrition='No'
GROUP BY education_level

create view education as
SELECT E1.EDUCATION_LEVEL,NUM_OF_attrition,NUM_OF_remain, NUM_OF_attrition/(NUM_OF_attrition+NUM_OF_remain) attrition_RATE,
RANK() OVER ( ORDER BY NUM_OF_attrition/(NUM_OF_attrition+NUM_OF_remain)desc ) ranking
FROM E1,E2
WHERE E1.education_LEVEL=E2.education_LEVEL select * from education
select max(attrition_rate)-min(attrition_rate) difference2 from education

#Work Life Balance:

create view w1 as
SELECT work_life_balance_rate, COUNT(EMPLOYEE_ID) NUM_OF_attrition FROM IBM_work_life A, IBM_EMPLOYEE B
WHERE A.work_life_balance_id=B.work_life_balance_id and attrition='Yes'
GROUP BY work_life_balance_rate

create view w2 as
SELECT work_life_balance_rate, COUNT(EMPLOYEE_ID) NUM_OF_remain FROM IBM_work_life A, IBM_EMPLOYEE B
WHERE A.work_life_balance_id=B.work_life_balance_id and attrition='No'
GROUP BY work_life_balance_rate

create view work_life as
SELECT w1.work_life_balance_rate,NUM_OF_attrition,NUM_OF_remain, NUM_OF_attrition/(NUM_OF_attrition+NUM_OF_remain) attrition_RATE,
RANK() OVER ( ORDER BY NUM_OF_attrition/(NUM_OF_attrition+NUM_OF_remain)desc ) ranking
FROM w1,w2
WHERE w1.work_life_balance_rate=w2.work_life_balance_rate select * from work_life
 

select max(attrition_rate)-min(attrition_rate) difference3 from work_life

#Gender:

create view g1 as
SELECT gender_name, COUNT(EMPLOYEE_ID) NUM_OF_attrition FROM IBM_gender A, IBM_EMPLOYEE B
WHERE A.gender_ID=B.gender_ID and attrition='Yes'
GROUP BY gender_name

create view g2 as
SELECT gender_name, COUNT(EMPLOYEE_ID) NUM_OF_remain FROM IBM_gender A, IBM_EMPLOYEE B
WHERE A.gender_ID=B.gender_ID and attrition='No'
GROUP BY gender_name

CREATE VIEW gender AS
SELECT g1.gender_name,NUM_OF_attrition,NUM_OF_remain, NUM_OF_attrition/(NUM_OF_attrition+NUM_OF_remain) attrition_RATE,
RANK() OVER ( ORDER BY NUM_OF_attrition/(NUM_OF_attrition+NUM_OF_remain)desc ) ranking
FROM g1,g2
WHERE g1.gender_name=g2.gender_name select * from gender
select max(attrition_rate)-min(attrition_rate) difference4 from gender

#Stock:

create view st1 as
SELECT stock_option_level, COUNT(EMPLOYEE_ID) NUM_OF_attrition FROM IBM_stock A, IBM_EMPLOYEE B
WHERE A.stock_option_id=B.stock_option_id and attrition='Yes'
GROUP BY stock_option_level

create view st2 as
SELECT stock_option_level, COUNT(EMPLOYEE_ID) NUM_OF_remain
 
FROM IBM_stock A, IBM_EMPLOYEE B
WHERE A.stock_option_id=B.stock_option_id and attrition='No'
GROUP BY stock_option_level

CREATE VIEW stock_option AS
SELECT st1.stock_option_level,NUM_OF_attrition,NUM_OF_remain, NUM_OF_attrition/(NUM_OF_attrition+NUM_OF_remain) attrition_RATE,
RANK() OVER ( ORDER BY NUM_OF_attrition/(NUM_OF_attrition+NUM_OF_remain)desc ) ranking
FROM st1,st2
WHERE st1.stock_option_level=st2.stock_option_level select * from stock_option
select max(attrition_rate)-min(attrition_rate) difference5 from stock_option

#Job History:

CREATE VIEW Job_History AS
select attrition, round(avg(total_working_years)) average_total_working_years, round(avg(years_in_current_role)) average_years_in_current_role, round(avg(years_since_last_promotion)) average_years_since_last_promotion , round(avg(years_with_current_manager)) average_years_with_current_manager from ibm_employee emp
inner join IBM_History his
on (emp.employee_number = his.employee_id) group by attrition

#Job Role:

create view j1 as
SELECT job_role, COUNT(employee_number) NUM_OF_attrition FROM IBM_job A, IBM_EMPLOYEE B
WHERE A.job_id=B.job_id and attrition='Yes' GROUP BY job_role create view j2 as
SELECT job_role, COUNT(employee_number) NUM_OF_remain FROM IBM_job A, IBM_EMPLOYEE B
WHERE A.job_id=B.job_id and attrition='No'
 
GROUP BY job_role CREATE VIEW Job_role AS
SELECT j1.job_role,NUM_OF_attrition,NUM_OF_remain, concat((round(NUM_OF_attrition*100/(NUM_OF_attrition+NUM_OF_remain),2)),'%') Percentage
FROM j1,j2
WHERE j1.job_role=j2.job_role

#Department:

create view d1 as
SELECT department_name, COUNT(employee_number) NUM_OF_attrition FROM IBM_department A, IBM_EMPLOYEE B
WHERE A.department_id=B.department_id and attrition='Yes'
GROUP BY department_name create view d2 as
SELECT department_name, COUNT(employee_number) NUM_OF_remain FROM IBM_department A, IBM_EMPLOYEE B
WHERE A.department_id=B.department_id and attrition='No'
GROUP BY department_name CREATE VIEW Department_name AS
SELECT d1.department_name,NUM_OF_attrition,NUM_OF_remain, concat((round(NUM_OF_attrition*100/(NUM_OF_attrition+NUM_OF_remain),2)),'%') Attrition_Percentage
FROM d1,d2
WHERE d1.department_name=d2.department_name

#Travel Frequency:

create view b1 as
SELECT Buss_travel_freq, COUNT(employee_number) NUM_OF_attrition FROM IBM_Business A, IBM_EMPLOYEE B
WHERE A.Buss_travel_id=B.Buss_travel_id and attrition='Yes'
GROUP BY Buss_travel_freq create view b2 as
SELECT Buss_travel_freq, COUNT(employee_number) NUM_OF_remain FROM IBM_Business A, IBM_EMPLOYEE B
WHERE A.Buss_travel_id=B.Buss_travel_id and attrition='No'
GROUP BY Buss_travel_freq CREATE VIEW Travel_Frequency AS
 
SELECT b1.Buss_travel_freq,NUM_OF_attrition,NUM_OF_remain, concat((round(NUM_OF_attrition*100/(NUM_OF_attrition+NUM_OF_remain),2)),'%') Attrition_Percentage
FROM b1,b2
WHERE b1.Buss_travel_freq=b2.Buss_travel_freq

#Average income and age:

CREATE VIEW Average_income AS
select attrition, round(avg(monthly_income)) Average_income, round(avg(age)) Average_Age from IBM_EMPLOYEE
group by attrition

#Marital Status:

create view m1 as
SELECT mar.marital_status_name, count(*) as number_of_employees_attritioned FROM ibm_marital mar
JOIN
ibm_employee emp ON(emp.marital_status_id=mar.martial_status_id) GROUP BY mar.marital_status_name, emp.attrition HAVING emp.attrition='Yes'
ORDER BY number_of_employees_attritioned DESC create view m2 as
SELECT mar.marital_status_name, count(*) as number_of_employees_remained FROM ibm_marital mar
JOIN
ibm_employee emp ON(emp.marital_status_id=mar.martial_status_id) GROUP BY mar.marital_status_name, emp.attrition HAVING emp.attrition='No'
ORDER BY number_of_employees_remained DESC CREATE VIEW marital AS
SELECT
m1.marital_status_name,number_of_employees_attritioned,number_of_employees_remained, (round(number_of_employees_attritioned/(number_of_employees_attritioned+number_of_empl oyees_remained),4))*100 attrition_precentage
FROM m1,m2
WHERE m1.marital_status_name=m2.marital_status_name ORDER BY number_of_employees_attritioned DESC
 
#Performance Score:

create view p1 as
SELECT per.performance_score, count(*) as number_of_employees_attritioned FROM ibm_perform per
JOIN
ibm_employee emp ON(emp.performance_id=per.performance_id) GROUP BY per.performance_score, emp.attrition HAVING emp.attrition='Yes'
ORDER BY number_of_employees_attritioned DESC create view p2 as
SELECT per.performance_score, count(*) as number_of_employees_remained FROM ibm_perform per
JOIN
ibm_employee emp ON(emp.performance_id=per.performance_id) GROUP BY per.performance_score, emp.attrition HAVING emp.attrition='No'
ORDER BY number_of_employees_remained DESC CREATE VIEW perform AS
SELECT
p1.performance_score,number_of_employees_attritioned,number_of_employees_remained, (round(number_of_employees_attritioned/(number_of_employees_attritioned+number_of_empl oyees_remained),4))*100 attrition_precentage
FROM p1,p2
WHERE p1.performance_score=p2.performance_score ORDER BY number_of_employees_attritioned DESC

#Relationship Satisfaction:

create view relation1 as
SELECT rel.relation_satis_score, count(*) as number_of_employees_attritioned FROM ibm_relation rel
JOIN
ibm_employee emp ON(emp.relation_satis_id=rel.relation_satis_id) GROUP BY rel.relation_satis_score, emp.attrition HAVING emp.attrition='Yes'
ORDER BY number_of_employees_attritioned DESC create view relation2 as
SELECT rel.relation_satis_score, count(*) as number_of_employees_remained FROM ibm_relation rel
JOIN
 
ibm_employee emp ON(emp.relation_satis_id=rel.relation_satis_id) GROUP BY rel.relation_satis_score, emp.attrition HAVING emp.attrition='No'
ORDER BY number_of_employees_remained DESC CREATE VIEW relation AS
SELECT
relation1.relation_satis_score,number_of_employees_attritioned,number_of_employees_remain ed, (round(number_of_employees_attritioned/(number_of_employees_attritioned+number_of_empl oyees_remained),4))*100 attrition_precentage
FROM relation1,relation2
WHERE relation1.relation_satis_score=relation2.relation_satis_score ORDER BY attrition_precentage DESC

#Environmental Satisfaction:

create view enviro1 as
SELECT env.enviro_satis_score, count(*) as number_of_employees_attritioned FROM ibm_enviro env
JOIN
ibm_employee emp ON(emp.enviro_satis_id=env.enviro_satis_id) GROUP BY env.enviro_satis_score, emp.attrition HAVING emp.attrition='Yes'
ORDER BY number_of_employees_attritioned DESC create view enviro2 as
SELECT env.enviro_satis_score, count(*) as number_of_employees_remained FROM ibm_enviro env
JOIN
ibm_employee emp ON(emp.enviro_satis_id=env.enviro_satis_id) GROUP BY env.enviro_satis_score, emp.attrition HAVING emp.attrition='No'
ORDER BY number_of_employees_remained DESC CREATE VIEW enviro AS
SELECT
enviro1.enviro_satis_score,number_of_employees_attritioned,number_of_employees_remained
,
(round(number_of_employees_attritioned/(number_of_employees_attritioned+number_of_empl oyees_remained),4))*100 attrition_precentage
FROM enviro1,enviro2
WHERE enviro1.enviro_satis_score=enviro2.enviro_satis_score ORDER BY attrition_precentage DESC
 
#Job Satisfaction:

create view job_satis1 as
SELECT job.job_satis_score, count(*) as number_of_employees_attritioned FROM ibm_job_satis job
JOIN
ibm_employee emp ON(emp.job_satis_id=job.job_satis_id) GROUP BY job.job_satis_score, emp.attrition HAVING emp.attrition='Yes'
ORDER BY number_of_employees_attritioned DESC create view job_satis2 as
SELECT job.job_satis_score, count(*) as number_of_employees_remained FROM ibm_job_satis job
JOIN
ibm_employee emp ON(emp.job_satis_id=job.job_satis_id) GROUP BY job.job_satis_score, emp.attrition HAVING emp.attrition='No'
ORDER BY number_of_employees_remained DESC CREATE VIEW job_satis AS
SELECT
job_satis1.job_satis_score,number_of_employees_attritioned,number_of_employees_remained
,
(round(number_of_employees_attritioned/(number_of_employees_attritioned+number_of_empl oyees_remained),4))*100 attrition_precentage
FROM job_satis1,job_satis2
WHERE job_satis1.job_satis_score=job_satis2.job_satis_score ORDER BY attrition_precentage DESC
