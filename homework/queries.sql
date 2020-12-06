-- Salary by employee
SELECT  emp.emp_no,
        emp.last_name,
        emp.first_name,
        emp.sex,
        sal.salary
FROM employees as emp
    INNER JOIN salaries as sal
    ON (emp.emp_no = sal.emp_no)
ORDER BY emp.emp_no;

-- Employees hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'
	
-- Manager for each department
SELECT 
	dm.dept_no, 
	dp.dept_name, 
	em.last_name,
	em.first_name
FROM depart_manager AS dm
	INNER JOIN departments AS dp
		ON (dm.dept_no = dp.dept_no)
	INNER JOIN employees AS em
		ON (dm.emp_no = em.emp_no);

-- Department of each employee
SELECT  em.emp_no,
        em.last_name,
        em.first_name,
        d.dept_name
FROM employees AS em
    INNER JOIN depart_emp AS de
        ON (em.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
ORDER BY em.emp_no;

-- Employees whose first name is "Hercules" and last name begins with "B"
SELECT first_name, last_name, birth_date, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- Employees in the Sales department
SELECT  em.emp_no,
        em.last_name,
        em.first_name,
        d.dept_name
FROM employees AS em
    INNER JOIN depart_emp AS de
        ON (em.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
WHERE d.dept_name = 'Sales'
ORDER BY em.emp_no;

-- Employees in Sales and Development departments
SELECT  em.emp_no,
        em.last_name,
        em.first_name,
        d.dept_name
FROM employees AS em
    INNER JOIN depart_emp AS de
        ON (em.emp_no = de.emp_no)
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
WHERE d.dept_name IN ('Sales', 'Development')
ORDER BY em.emp_no;

-- The frequency of employee last names
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;

