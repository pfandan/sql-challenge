/****************************   Analytics ********************************************
1. List the employee number, last name, first name, sex, and salary of each employee.
**************************************************************************************/

select e.emp_no, e.last_name, e.first_name, e.sex, s.salary 
from employees e 
inner join salaries s 
ON e.emp_no= s.emp_no ;

/********************************   Analytics *************************************************
 2. List the first name, last name, and hire date for the employees who were hired in 1986.
********************************************************************************************/
-- Using date_part 
select  e.first_name, e.last_name, e.hire_date 
from employees e   WHERE date_part('year', hire_date) = 1986;
-- Using extract 
select  e.first_name, e.last_name, e.hire_date 
from employees e   WHERE extract('year' from hire_date) = 1986;

/********************************   Analytics *************************************************
 List the manager of each department along with their department number, 
 department name, employee number, last name, and first name.
********************************************************************************************/

select de.emp_no ,e.first_name, e.last_name,de.dept_no, d.dept_name 
from (departments d JOIN dept_manager de on d.dept_no=de.dept_no)
 join employees e ON de.emp_no = e.emp_no ; 

/*****************************************************************************************************
List the department number for each employee along with that employee’s employee number, last name, 
first name, and department name
*****************************************************************************************************/
select de.dept_no, de.emp_no, e.last_name, e.first_name ,
       d.dept_name from (departments d JOIN dept_emp de on d.dept_no = de.dept_no)
	   join employees e ON de.emp_no=e.emp_no;
	 
	 
/****************************************************************************************************
List first name, last name, and sex of each employee whose first name is Hercules and whose last name
begins with the letter B.
*****************************************************************************************************/
select e.first_name, e.last_name, e.sex from employees e where e.first_name ='Hercules' and 
e.last_name like 'B%';

/****************************************************************************************************
List each employee in the Sales department, including their employee number, last name, and first name.
*****************************************************************************************************/

select e.emp_no, e.last_name, e.first_name , d.dept_name
from (employees e JOIN dept_emp de on e.emp_no= de.emp_no) 
join departments d on d.dept_no= de.dept_no
where d.dept_name = 'Sales';

/****************************************************************************************************
List each employee in the Sales and Development departments, including their employee number, last name,
first name, and department name.
*****************************************************************************************************/

select e.emp_no, e.last_name, e.first_name , d.dept_name
from (employees e JOIN dept_emp de on e.emp_no= de.emp_no) 
join departments d on d.dept_no= de.dept_no
where d.dept_name in ('Sales','Development');


/****************************************************************************************************
List the frequency counts, in descending order, of all the employee last names (that is, how many 
employees share each last name).
*****************************************************************************************************/
select last_name,count(last_name)
from employees e
group by e.last_name 
order by last_name desc ;




