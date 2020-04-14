--Queries

--1.List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT 	employees.emp_no,
		employees.last_name,
		employees.first_name,
		employees.gender,
		salaries.salary
FROM employees
inner join Salaries on
employees.emp_no = salaries.emp_no;

--2.List employees who were hired in 1986.
SELECT employees.last_name,
		employees.first_name,
		employees.hire_date
FROM employees
WHERE employees.hire_date > '12/31/1985' and employees.hire_date < '01/01/1987';
		
--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

SELECT 	dept_manager.emp_no,
		employees.last_name,
		employees.first_name,
		departments.dept_name,
		departments.dept_no,
		dept_manager.from_date,
		dept_manager.to_date	
FROM dept_manager
JOIN employees on
dept_manager.emp_no = employees.emp_no
JOIN departments on
departments.dept_no = dept_manager.dept_no;

--4.List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT	de.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
FROM 		dept_emp 	AS de
JOIN		employees 	AS e 
on de.emp_no = e.emp_no
JOIN 		departments AS d
on de.dept_no = d.dept_no

--5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT 	e.first_name,
		e.last_name
FROM 	employees AS e
WHERE	e.first_name = 'Hercules' 
AND 	e.last_name like 'B%';

--6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT	de.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
FROM 		employees 	AS e
JOIN		dept_emp  	AS de
on 		de.emp_no = e.emp_no
JOIN		departments AS d
on		d.dept_no = de.dept_no
WHERE	d.dept_name = 'Sales';

--7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT	de.emp_no,
		e.last_name,
		e.first_name,
		d.dept_name
FROM 		employees 	AS e
JOIN		dept_emp  	AS de
on 		de.emp_no = e.emp_no
JOIN		departments AS d
on		d.dept_no = de.dept_no
WHERE	d.dept_name = 'Sales' or d.dept_name ='Development';

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT 		last_name, count(last_name) AS name_count
FROM 		employees
GROUP BY	last_name
ORDER BY	name_count desc;
