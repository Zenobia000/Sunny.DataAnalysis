USE jdbc;

CREATE TABLE department (
	deptno		decimal(3)		PRIMARY KEY,
	dname		varchar(30)		NOT NULL
);

INSERT INTO department
   VALUES (100, 'IT');

INSERT INTO department
   VALUES (200, 'Accounting');
   
INSERT INTO department
   VALUES (300, 'Marketing');


CREATE TABLE employee (
	empno		decimal(4)		PRIMARY KEY,
	ename		varchar(30)		NOT NULL,
	hiredate	date			NOT NULL,
	salary		int				NOT NULL,
	deptno		decimal(3)		NOT NULL,
	title		varchar(30)		NOT NULL,
    FOREIGN KEY (deptno) REFERENCES department (deptno)
);

INSERT INTO employee
   VALUES (1001, 'Pam Pan', '2010-11-10', 56000, 100, 'senior engineer');

INSERT INTO employee
   VALUES (1002, 'Lily Lee', '2008-03-22', 34000, 100, 'engineer');
   
INSERT INTO employee
   VALUES (1003, 'Stephen Hsu', '2006-08-14', 77000, 200, 'manager');
   
INSERT INTO employee
   VALUES (1004, 'May Wu', '2011-04-04', 67000, 300, 'manager');
   
INSERT INTO employee
   VALUES (1005, 'Tina Wang', '2013-12-25', 37000, 200, 'engineer');
   
INSERT INTO employee
   VALUES (1006, 'Allen Hu', '2007-07-06', 44000, 300, 'senior engineer');

INSERT INTO employee
   VALUES (1007, 'David Ho', '2009-09-11', 39000, 100, 'engineer');

INSERT INTO employee
   VALUES (1008, 'Viginia Kuo', '2000-05-16', 55000, 100, 'engineer');

