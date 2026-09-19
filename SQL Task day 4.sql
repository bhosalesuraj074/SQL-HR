

-- Q1. List first_name, last_name, salary of employees in department 60, salary descending.
	
	SELECT  first_name, e.last_name, e.salary  
	from employees e 
	WHERE  e.department_id =60;
	
--Q2. Display department_id and number of employees in each department. Include departments with employees only.
	
	SELECT e.department_id , COUNT(*)
	from employees e 
	GROUP by e.department_id ;

-- Q3. Find employees whose last_name starts with ‘S’ and salary > 8000.

	select *
	from employees e
	WHERE e.last_name like 'S%' AND e.salary >8000;
	
-- Q4. Show country_id and country_name for countries in region 1 (Europe).
	
	SELECT c.country_id , c.country_name 
	from countries c  
	WHERE c.region_id =1;
	
-- Q5. For each department, show department_name and average salary, only if avg salary > 8000. Order by avg salary desc.
	select  d.department_name , AVG(e.salary) as avg_Salary
	from employees e  
	left join departments d on e.department_id = d.department_id
	GROUP by d.department_name 
	HAVING AVG(e.salary ) > 8000
	ORDER by avg_Salary desc;
	
-- Q6. List employees who earn more than their department’s average salary. Show name, salary, department_id. 
	SELECT * 
	from employees e 
	WHERE e.salary > (
		select AVG(e2.salary) 
		from employees e2 
		where e.department_id = e2.department_id );