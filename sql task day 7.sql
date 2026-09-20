
-- Q1. List first_name, last_name, salary of employees in department 50 (Shipping) earning more than 3000, ordered by salary desc.
	SELECT *
	from employees e
	WHERE e.department_id =50 and e.salary > 3000
	order BY e.salary ;

-- Q2. Count employees per job_id.
	
	select e.job_id , COUNT(e.employee_id ) 
	from employees e 
	GROUP By e.job_id ;
	
-- Q3. Employees hired in 2005 (use EXTRACT or TO_CHAR).
	
	select *
	from employees e
	where year(e.hire_date ) = 2005;
	
-- Q4. Department name and city for all departments that have a location.
	
	select d.department_name , l.city 
	from departments d 
	join locations l on d.location_id = l.location_id;
	
-- Q5. Employees who earn more than their own department average. Show name, salary, dept_id, dept_avg.
	
	SELECT e.first_name , e.salary , e.department_id 
	from employees e 
	WHERE e.salary >=
		(select AVG(e2.salary) from employees e2 where e2.department_id =e.department_id );
	
-- Q6. Departments with more than 5 employees. Show department_name and emp_count.
	
	SELECT d.department_name , COUNT (*)
	from departments d 
	join employees e on d.department_id =e.department_id 
	GROUP by d.department_name
	having COUNT(*)> 5 ;
	
-- Q7. For each country, number of departments located there. Include countries with zero departments. 
	
	select c.country_name , COUNT (d.department_id )
	from countries c 
	left join locations l on c.country_id = l.country_id
	left join departments d on d.location_id = l.location_id
	GROUP by c.country_name ;
	
	
	
	
	