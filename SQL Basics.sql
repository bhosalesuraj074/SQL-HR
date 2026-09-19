--- Day 2 task

-- Q1. Display employee_id, first_name, last_name, salary for employees with salary > 10000. Order by salary descending.

	SELECT e.department_id , e.first_name, e.last_name , e.salary 
	FROM employees e 
	WHERE e.salary > 10000
	order by e.salary desc;


-- Q2. List distinct job_id values from EMPLOYEES in alphabetical order.

	select DISTINCT e.job_id 
	from employees e 
	ORDER by e.job_id ;

-- Q3. Count employees per department_id. Include departments that exist in EMPLOYEES. Order by count descending.
		
	SELECT e.department_id , COUNT(*) as count 
	from employees e 
	GROUP by e.department_id 
	ORDER by count desc;
	
-- Q4. Employees hired in 2006 (hire_date year = 2000). Show name and hire date.
	
	SELECT * 
	FROM employees e 
	WHERE YEAR(e.hire_date) = 2000;

-- Q5. For each department, show department_name, employee count, and average salary. Exclude departments with no employees. Order by average salary descending.
	
	SELECT  d.department_name ,COUNT(*) , AVG(e.salary ) avg_salary
	FROM employees e 
	join departments d on e.department_id  = d.department_id
	GROUP by d.department_name  
	order by avg_salary desc; 
	
-- Q6. Employees who earn more than the average salary of their own department. Show name, salary, department_id.
	
	
	SELECT e.first_name , e.salary , e.department_id 
	from employees e WHERE e.salary >
	(	select AVG(e2.salary) from employees e2 
		where e.department_id = e2.department_id 
	);

-- Q7. List employees in city Seattle (via department → location). Show employee name, department name, city.
	
	select e.first_name , d.department_name , l.city 
	from employees e 
	join departments d on e.department_id  = d.department_id 
	join locations l on d.location_id = l.location_id 
	where l.city = 'Seattle';

-- Q8. For each job, show job_title, number of employees, min salary in EMPLOYEES, max salary in EMPLOYEES, and whether any employee is outside the job’s MIN_SALARY/MAX_SALARY band (Y/N).
	SELECT 
    j.job_title,
    COUNT(e.employee_id) AS total_employees,
    MIN(e.salary) AS actual_min_salary,
    MAX(e.salary) AS actual_max_salary
	FROM jobs j
	LEFT JOIN employees e ON j.job_id = e.job_id
	GROUP BY j.job_id, j.job_title, j.min_salary, j.max_salary;

-- Q9. Find the second-highest salary in each department. Return department_id, second_highest_salary. Departments with fewer than 2 distinct salaries should not appear.

	SELECT top 10 e.department_id , max(e.salary) 
	from employees e 
	WHERE e.salary < (select  max(e2.salary)  from employees e2 where e2.department_id = e.department_id )
	GROUP by e.department_id  ;
	

	select d.department_name ,  max(e.salary) 
	from employees e 
	left join departments d on e.department_id = d.department_id
	group by d.department_name 
	HAVING d.department_name is NOT null
	;
	
	
	




