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
SELECT *
FROM employees	
WHERE EXTRACT(year FROM hire_date) = 1986;


---3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.

