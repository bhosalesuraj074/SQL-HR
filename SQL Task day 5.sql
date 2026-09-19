

-- B1. List first_name, last_name, salary of employees in department 50, ordered by salary descending. 

	select e.first_name , e.last_name , e.salary 
	from employees e 
	WHERE e.department_id = 50
	ORDER by e.salary DESC ;

-- B2. Count employees per department_id. Include departments with zero employees? No — only departments that have at least one employee. Order by count desc.
	select d.department_id, COUNT(e.employee_id ) as count
	from departments d 
	left join employees e on d.department_id = e.department_id
	GROUP by d.department_id 
	HAVING COUNT(e.employee_id ) > 0
	order by count desc;

-- B3. Employees hired in 2008 (hire_date year = 2008). Show employee_id, last_name, hire_date.
	
   select  e.employee_id , e.last_name , e.hire_date 
   from employees e 
   where Year(e.hire_date ) = 1999;
   
 -- B4. Employee full name and department name for all employees who have a department. Order by department name, then last name.
   select e.first_name +' '+ e.last_name as Full_name , d.department_name 
   from employees e 
    join departments d on e.department_id = d.department_id
   ORDER by d.department_name , e.last_name ;
 
 -- B5. For each job_id, show job_title, number of employees, average salary (2 decimals). Exclude jobs with no employees. Order by avg salary desc.
 	select e.job_id , j.job_title , COUNT(e.employee_id ) as count , ROUND(AVG(e.salary), 2)as avg_salary
 	from employees e 
 	join jobs j on e.job_id = j.job_id
 	group by e.job_id , j.job_title 
 	having COUNT (e.employee_id ) > 0
 	ORDER by avg_salary ;
 
 -- B6. Employees who earn more than the average salary of their own department. Show last_name, department_id, salary. Order by department_id, salary desc.
 
 	
	SELECT e.last_name , e.department_id ,e.salary 
	from employees e 
	WHERE e.salary >= 
	(SELECT avg(e2.salary )
	 from employees e2 
	 where e2.department_id = e.department_id 
	)
	ORDER by department_id ,e.salary DESC ;
	
-- B7. Departments whose average salary is greater than 8000 and that have at least 5 employees. Show department_id, department_name, emp_count, avg_sal.
	
	select d.department_id , d.department_name , COUNT (e.employee_id ) as count , AVG(e.salary) as Average_salary
	from departments d 
	join employees e on d.department_id = e.department_id 
	group by d.department_id , d.department_name 
	having AVG(e.salary) > 8000 AND COUNT (e.employee_id ) >= 5;
	
	
	 
	
	
	
	
	
   
	