INSERT INTO employee (employee_id, employee_name, job_title, manager_id ,date_hired, salary, department_id) VALUES (employee_seq.nextval, 'John Smith', 'CEO',NULL , TO_DATE('01-JAN-1995','DD-MON-YYYY'), 100000, (SELECT department_id FROM department WHERE department_name = 'Management'));

INSERT INTO employee (employee_id, employee_name, job_title, manager_id ,date_hired, salary, department_id) VALUES (employee_seq.nextval, 'Jimmy Willis', 'Manager',(SELECT employee_id FROM employee WHERE employee_name = 'John Smith') , TO_DATE('23-SEP-2003','DD-MON-YYYY'), 52500, (SELECT department_id FROM department WHERE department_name = 'Sales'));

INSERT INTO employee (employee_id, employee_name, job_title, manager_id ,date_hired, salary, department_id) VALUES (employee_seq.nextval, 'Roxy Jones', 'Salesperson',(SELECT employee_id FROM employee WHERE employee_name = 'Jimmy Willis') , TO_DATE('11-FEB-2017','DD-MON-YYYY'), 35000, (SELECT department_id FROM department WHERE department_name = 'Sales'));

INSERT INTO employee (employee_id, employee_name, job_title, manager_id ,date_hired, salary, department_id) VALUES (employee_seq.nextval, 'Selwyn Field', 'Salesperson',(SELECT employee_id FROM employee WHERE employee_name = 'Roxy Jones') , TO_DATE('20-MAY-2015','DD-MON-YYYY'), 32000, (SELECT department_id FROM department WHERE department_name = 'Sales'));

INSERT INTO employee (employee_id, employee_name, job_title, manager_id ,date_hired, salary, department_id) VALUES (employee_seq.nextval, 'Sarah Phelps', 'Manager',(SELECT employee_id FROM employee WHERE employee_name = 'John Smith') , TO_DATE('21-MAR-2015','DD-MON-YYYY'), 45000, (SELECT department_id FROM department WHERE department_name = 'Engineering'));

INSERT INTO employee (employee_id, employee_name, job_title, manager_id ,date_hired, salary, department_id) VALUES (employee_seq.nextval, 'David Hallett', 'Engineer',(SELECT employee_id FROM employee WHERE employee_name = 'Sarah Phelps') , TO_DATE('17-APR-2018','DD-MON-YYYY'), 40000, (SELECT department_id FROM department WHERE department_name = 'Engineering'));

INSERT INTO employee (employee_id, employee_name, job_title, manager_id ,date_hired, salary, department_id) VALUES (employee_seq.nextval, 'Louise Harper', 'Engineer',(SELECT employee_id FROM employee WHERE employee_name = 'Sarah Phelps') , TO_DATE('01-JAN-2013','DD-MON-YYYY'), 47000, (SELECT department_id FROM department WHERE department_name = 'Engineering'));

INSERT INTO employee (employee_id, employee_name, job_title, manager_id ,date_hired, salary, department_id) VALUES (employee_seq.nextval, 'Gus Jones', 'Manager',(SELECT employee_id FROM employee WHERE employee_name = 'John Smith') , TO_DATE('05-MAY-2018','DD-MON-YYYY'), 50000, (SELECT department_id FROM department WHERE department_name = 'Research & Development'));

INSERT INTO employee (employee_id, employee_name, job_title, manager_id ,date_hired, salary, department_id) VALUES (employee_seq.nextval, 'Tina Hart', 'Engineer',(SELECT employee_id FROM employee WHERE employee_name = 'Gus Jones') , TO_DATE('28-JUL-2014','DD-MON-YYYY'), 45000, (SELECT department_id FROM department WHERE department_name = 'Research & Development'));

INSERT INTO employee (employee_id, employee_name, job_title, manager_id ,date_hired, salary, department_id) VALUES (employee_seq.nextval, 'Mildred Hall', 'Secretary',(SELECT employee_id FROM employee WHERE employee_name = 'John Smith') , TO_DATE('12-OCT-1996','DD-MON-YYYY'), 35000, (SELECT department_id FROM department WHERE department_name = 'Management'));

COMMIT;
