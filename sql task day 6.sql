--Q1. Display first_name, last_name, salary of employees earning more than 10000, ordered by salary descending.
	select e.first_name , e.last_name ,e.salary 
	from employees e 
	where e.salary > 10000
	order by e.salary desc;

-- Q2. Count employees in each department. Show department_name and count. Include departments with zero employees if you can (left join).
	select d.department_name , count (e.employee_id )
	from employees e 
	right JOIN  departments d on e.department_id = d.department_id 
	group by d.department_name ;

-- Q3. List distinct job_id values from EMPLOYEES.
	
	SELECT distinct e.job_id  
	from employees e ;
	
	select e.job_id 
	from employees e
	group by e.job_id ;
	
-- Q4. Employees hired in 2005 (year only). Show name and hire_date.
	
	SELECT e.first_name , e.hire_date 
	from employees e 
	where Year(e.hire_date ) =2005;
	
-- Q5. For each department, show department name, number of employees, and average salary (rounded to 2 decimals). Only departments with at least 2 employees.
	
	select d.department_name , COUNT(e.employee_id ) count , ROUND(AVG(e.salary ), 2) 
	from departments d 
	join employees e on e.department_id = d.department_id 
	GROUP by d.department_name 
	having COUNT(e.employee_id ) > 2
	;
	
--  Q6. Employees who earn more than their own manager. Show employee name, emp salary, manager name, manager salary.

	select e.first_name as emp_name ,e.salary emp_salary,  m.first_name as manager_name , m.salary as manager_salary
	from employees e
	join employees m on e.manager_id = m.employee_id 
	WHERE e.salary > m.salary ;
	
-- Q7. List employees working in cities in the United States (country_id = 'US'). Show name, department, city.
	
	select e.first_name , d.department_name , l.city 
	from employees e 
	join departments d on e.department_id = d.department_id 
	JOIN locations l on d.location_id = l.location_id
	join countries c on l.country_id = c.country_id
	where c.country_id = 'US';
