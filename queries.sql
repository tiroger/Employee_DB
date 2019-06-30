---1. List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	e.gender,
	s.salary
FROM
	salaries s
	INNER JOIN employees e ON e.emp_no = s.emp_no;

---2. List employees who were hired in 1986.
SELECT
	*
FROM
	employees
WHERE
	EXTRACT(year FROM hire_date) = 1986;

---3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT
	d.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name,
	dm.from_date,
	dm.to_date
FROM
	departments d
	INNER JOIN dept_manager dm ON dm.dept_no = d.dept_no
	JOIN employees e ON e.emp_no = dm.emp_no;

---4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	employees e
	INNER JOIN dept_emp de ON de.emp_no = e.emp_no
	JOIN departments d ON d.dept_no = de.dept_no;

---5. List all employees whose first name is "Hercules" and last names begin with "B."
SELECT
	*
FROM
	employees
WHERE
	first_name = 'Hercules'
	AND last_name LIKE 'B%';

---6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	employees e
	INNER JOIN dept_emp de ON e.emp_no = de.emp_no
	JOIN departments d ON d.dept_no = de.dept_no
WHERE
	dept_name = 'Sales';

---7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
FROM
	employees e
	INNER JOIN dept_emp de ON e.emp_no = de.emp_no
	JOIN departments d ON d.dept_no = de.dept_no
WHERE
	dept_name = 'Sales'
	OR 
	dept_name = 'Development';

---8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT
	last_name,
	COUNT(last_name)
FROM
	employees
GROUP BY
	last_name
ORDER BY
	COUNT DESC;