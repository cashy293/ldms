/************************************************************************************
Test creating employee
*************************************************************************************/
SELECT count(*)
FROM employee
WHERE employee_name = 'Creation Test'
--RESULT: No rows returned
; 


 BEGIN   employee_package.create_employee(p_employee_name    => 'Creation Test'
                                         ,p_job_title        => 'Manager'
                                         ,p_manager_id       => NULL
                                         ,p_date_hired       => sysdate 
                                         ,p_salary           => 100
                                         ,p_department_id    => 1
                                         );
 END; 

 
--Test creating employee
SELECT count(*)
FROM employee
WHERE employee_name = 'Creation Test'
--RESULT: 1 Row returned.  Success
;   



/************************************************************************************
Test Updating Salary
*************************************************************************************/
SELECT salary
,      employee_id
FROM employee
WHERE employee_name = 'John Smith'
--RESULT: 100000, 1
; 


 BEGIN   employee_package.update_salary (p_employee_id => 1
                                        ,p_adjustment  => 50
                                        );
 END; 

 
--Test Updating Salary
SELECT salary
,      employee_id
FROM employee
WHERE employee_name = 'John Smith'
--RESULT: 150000, 1. Success
;   


/************************************************************************************
Test Updating Department
*************************************************************************************/
SELECT department_id
,      employee_id
FROM employee
WHERE employee_name = 'John Smith'
--RESULT: 4, 1
; 


 BEGIN   employee_package.transfer_employee (p_employee_id    => 1
                                            ,p_department_id  => 1
                                            );
 END; 

 
--Test transferring employee
SELECT department_id
,      employee_id
FROM employee
WHERE employee_name = 'John Smith'
--RESULT: 1, 1. Success
; 