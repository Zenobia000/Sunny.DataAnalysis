DROP PROCEDURE IF EXISTS qry_emp;

DELIMITER $
CREATE PROCEDURE qry_emp (
	IN 	p_empno		decimal(4),
	OUT p_ename		varchar(30),
	OUT p_salary	int
)
BEGIN
	SELECT ename, salary INTO p_ename, p_salary FROM employee WHERE empno = p_empno;
END $

DELIMITER ;
