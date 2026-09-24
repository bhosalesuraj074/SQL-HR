
-- S1. List first_name, last_name, salary of employees in department 90 (Executive), ordered by salary descending.

   select e.first_name , e.last_name , e.salary 
   from employees e 
   where e.department_id =90
   order by e.salary desc;
   
-- S2. Count employees whose salary is between 5000 and 10000 inclusive. Expected (classic HR): 51
   select COUNT(*)
   from employees e
   where e.salary BETWEEN 5000 and 10000;

-- S3. Display distinct job_id values from EMPLOYEES, ordered alphabetically. How to approach: SELECT DISTINCT + ORDER BY.
	select distinct e.job_id  
	from employees e
	ORDER by e.job_id ;

-- S4. Find the employee(s) with the minimum hire_date (earliest hired). Show employee_id, last_name, hire_date.

	select e.employee_id , e.last_name , e.hire_date 
	from employees e 
	WHERE e.hire_date = (select MIN(e.hire_date ) from employees e );
	
-- S5. For each department, show department_name and number of employees. Include departments with zero employees. Order by count descending.
	
	select d.department_name , COUNT(e.employee_id ) as Count_of_Emp
	from departments d
	left join employees e on d.department_id = e.department_id
	group by d.department_name 
	order by Count_of_Emp desc;

	
-- S6. List employees who earn more than the average salary of the whole company. Show last_name, salary, and how much above average (salary - avg).
	
	select e.first_name ,e.salary 
	from employees e 
	where e.salary = (select AVG(e2.salary ) from employees e2 WHERE e.department_id = e2.department_id );
	
-- S7. Show job_title and the number of employees holding that job. Only jobs that have more than 3 employees. Order by count desc.
	select j.job_title , COUNT(e.employee_id ) as count_emp
	from jobs j  
	join employees e on j.job_id = e.job_id
	GROUP by j.job_title 
	HAVING COUNT(e.employee_id ) >3
	order by count_emp 
	;
	
-- S8. Find the department that has the highest average salary. Display department_name and that average (rounded to 2 decimals).
	
	SELECT d.department_name , AVG(e.salary ) as avg
	from departments d 
	join employees e on d.department_id = e.department_id
	GROUP by d.department_name
	order by avg desc
	offset 0 rows
	fetch next 1 row only; 