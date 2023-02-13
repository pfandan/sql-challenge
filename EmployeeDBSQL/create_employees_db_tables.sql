-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


Drop Table  IF EXISTS  dept_emp  Cascade  ;
Drop table  IF EXISTS dept_manager Cascade  ; 
Drop table  IF EXISTS  departments  Cascade  ;
Drop table  IF EXISTS employees  Cascade  ;
Drop table  IF EXISTS salaries Cascade  ;
Drop table   IF EXISTS titles Cascade ;


CREATE TABLE departments (
    "dept_no" varchar(20)   NOT NULL,
    "dept_name" varchar(50)  NOT NULL,
    CONSTRAINT pk_departments PRIMARY KEY (
        "dept_no"
     )
);

COPY departments(dept_no, dept_name)
FROM '/Users/A406063/Desktop/Berkeley_projects/hw/sql-challenge/data/departments.csv'
DELIMITER ','
CSV HEADER;
;

CREATE TABLE titles(
    title_id varchar(20)   NOT NULL,
    title varchar(100)  NOT NULL,
     PRIMARY KEY (title_id)
);

COPY titles(title_id,title)
FROM '/Users/A406063/Desktop/Berkeley_projects/hw/sql-challenge/data/titles.csv'
DELIMITER ','
CSV HEADER;
;

CREATE TABLE employees (
    emp_no serial   NOT NULL,
    emp_title_id varchar(20)   NOT NULL,
	FOREIGN KEY (emp_title_id) REFERENCES titles(title_id),
    birth_date date   NOT NULL,
    first_name varchar(30)  NOT NULL,
    last_name varchar(30)  NOT NULL,
    sex varchar(2)   NOT NULL,
    hire_date date   NOT NULL,
     PRIMARY KEY (emp_no)
);


COPY employees(emp_no, emp_title_id, birth_date, first_name, last_name, sex, hire_date)
FROM '/Users/A406063/Desktop/Berkeley_projects/hw/sql-challenge/data/employees.csv'
DELIMITER ','
CSV HEADER;
;

CREATE TABLE dept_emp (
    "emp_no" serial   NOT NULL,
	 FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
    "dept_no" varchar(20) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	primary key (emp_no,dept_no)
);

COPY dept_emp(emp_no, dept_no)
FROM '/Users/A406063/Desktop/Berkeley_projects/hw/sql-challenge/data/dept_emp.csv'
DELIMITER ','
CSV HEADER;
;

CREATE TABLE dept_manager (
    "dept_no" varchar(20)   NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	"emp_no" serial   NOT NULL,
	 FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	 PRIMARY KEY ("dept_no", "emp_no")
);

COPY dept_manager(dept_no, emp_no)
FROM '/Users/A406063/Desktop/Berkeley_projects/hw/sql-challenge/data/dept_manager.csv'
DELIMITER ','
CSV HEADER;
;

CREATE TABLE salaries (
    "emp_no" serial  NOT NULL,
    "salary" float   NOT NULL  ,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	primary key (emp_no)
);
COPY salaries(emp_no, salary)
FROM '/Users/A406063/Desktop/Berkeley_projects/hw/sql-challenge/data/salaries.csv'
DELIMITER ','
CSV HEADER;
;


select count(*) from dept_emp   ;
select count(*) from dept_manager   ; 
select count(*) from  departments   ;
select * from employees    ;
select count(*) from salaries  ;
select count(*) from titles  ;







