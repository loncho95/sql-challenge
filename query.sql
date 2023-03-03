-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT
    emp_no,
    last_name,
    first_name,
    sex,
    salary
FROM employees e
JOIN salaries s
USING (emp_no);

-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
    first_name, 
    last_name, 
    hire_date 
FROM employees 
WHERE Extract('year' from hire_date) = '1986';

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT dm.dept_no, dm.emp_no, d.dept_name, e.emp_no, e.first_name, e.last_name
FROM departaments AS d 
	RIGHT JOIN dept_manager AS dm 
	ON d.dept_no = dm.dept_no
		RIGHT JOIN employees AS e 
		ON e.emp_no = dm.emp_no;	
	
-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
FROM employees AS e 
	RIGHT JOIN dept_emp AS de
	ON e.emp_no = de.emp_no
		RIGHT JOIN departaments AS d
		ON d.dept_no = de.dept_no;

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
    first_name, 
    last_name, 
    sex
FROM employees 
WHERE 
    first_name = 'Hercules' AND last_name LIKE 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.

SELECT 
    emp_no, 
    last_name, 
    first_name
FROM employees
WHERE emp_no IN
  (
  SELECT emp_no
  FROM dept_emp
  WHERE dept_no IN
  (
    SELECT dept_no
    FROM departaments
    WHERE dept_name = 'Sales' ));

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
    e.emp_no, 
    e.last_name, 
    e.first_name,
    d.dept_name
FROM 
    employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    JOIN departments d ON de.dept_no = d.dept_no
WHERE 
    d.dept_name IN ('Sales', 'Development');

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT COUNT(last_name)
FROM employees
WHERE last_name 