-- List the employee number, last name, first name, sex, and salary of each employee (2 points)

SELECT s.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s
ON s.emp_no = e.emp_no
ORDER BY s.emp_no;

-- List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)

SELECT emp_no, last_name, first_name, hire_date 
FROM employees 
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

-- List the manager of each department along with their department number, department name, employee number,
-- last name, and first name (2 points)

SELECT DISTINCT ON (dept_manager.dept_no)

		dept_manager.dept_no,
		departments.dept_name,
		dept_manager.emp_no,
		employees.last_name,
		employees.first_name
		
FROM dept_manager 

INNER JOIN departments 
 	ON dept_manager.dept_no= departments.dept_no
INNER JOIN employees 
	ON dept_manager.emp_no = employees.emp_no
ORDER BY dept_manager.dept_no;

-- List the department number for each employee along with that employee’s employee number, last name, first name,
-- and department name (2 points)

SELECT DISTINCT ON (e.emp_no)

	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
	
FROM employees AS e

LEFT JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
INNER JOIN departments AS d
	ON de.dept_no = d.dept_no
ORDER BY e.emp_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins
-- with the letter B (2 points)

SELECT 
		e.first_name,
		e.last_name,
		e.sex
		
FROM employees AS e
WHERE (e.first_name = 'Hercules') AND (LOWER(e.last_name) LIKE 'b%');

-- List each employee in the Sales department, including their employee number, last name, and first name (2 points)

SELECT
    e.emp_no,
    e.last_name,
    e.first_name
FROM
    employees AS e
JOIN
    dept_emp AS de ON e.emp_no = de.emp_no
JOIN
    departments AS d ON de.dept_no = d.dept_no
WHERE
    d.dept_name = 'Sales';


-- List each employee in the Sales and Development departments, including their employee number, last name, first name,
-- and department name (4 points)

SELECT
    e.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
FROM
    employees AS e
JOIN
    dept_emp AS de ON e.emp_no = de.emp_no
JOIN
    departments AS d ON de.dept_no = d.dept_no
WHERE
    d.dept_name IN ('Sales', 'Development');


-- List the frequency counts, in descending order, of all the employee last names
-- (that is, how many employees share each last name) (4 points)

SELECT
		e.last_name,
		COUNT(e.last_name) AS frequency
		
FROM	employees AS e

GROUP BY	e.last_name

ORDER BY	frequency DESC
;
