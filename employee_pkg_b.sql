create or replace PACKAGE BODY employee_package AS 
   
   /**********************************************************************************
   Create an appropriate executable database object to allow an Employee to be created
   ***********************************************************************************/
   PROCEDURE create_employee(p_employee_name    IN employee.employee_name%TYPE
                            ,p_job_title        IN employee.job_title%TYPE
                            ,p_manager_id       IN employee.manager_id%TYPE
                            ,p_date_hired       IN employee.date_hired%TYPE
                            ,p_salary           IN employee.salary%TYPE
                            ,p_department_id    IN employee.department_id%TYPE
                           )
    AS
    
    l_module VARCHAR2(50) := 'create_emp';
    
    BEGIN
     INSERT INTO employee (employee_id, 
                           employee_name, 
                           job_title, 
                           manager_id,
                           date_hired,
                           salary, 
                           department_id) 
     VALUES (employee_seq.nextval, 
             p_employee_name, 
             p_job_title,
             p_manager_id, 
             p_date_hired, 
             p_salary, 
             p_department_id
            );
             
     COMMIT;     
     
     EXCEPTION 
      WHEN OTHERS THEN raise_application_error (-20001, 'An exception was raised in : '||l_module|| 'error: '||SQLERRM);
             
    
    END create_employee;
    
  /*********************************************************************************************************************************
  Create an appropriate executable database object to allow the Salary for an Employee to be increased or decreased by a percentage 
  **********************************************************************************************************************************/
  PROCEDURE update_salary (p_employee_id IN employee.employee_id%TYPE
                          ,p_adjustment  IN NUMBER -- to decrease percentage, use negative number
                          )
  IS                          
   l_module VARCHAR2(50) := 'update_salary'; 
   
   
   BEGIN
    UPDATE employee
    SET salary = salary + (salary/(100/p_adjustment))
    WHERE employee_id = p_employee_id;
    
    COMMIT;
    
    EXCEPTION 
      WHEN OTHERS THEN raise_application_error (-20001, 'An exception was raised in : '||l_module|| 'error: '||SQLERRM);
   
   END update_salary;
   
  
  /**************************************************************************************************************
  Create an appropriate executable database object to allow the transfer of an Employee to a different Department
  ***************************************************************************************************************/
  
  PROCEDURE transfer_employee (p_employee_id   IN employee.employee_id%TYPE
                              ,p_department_id IN NUMBER --which department to transfer to
                              )
  IS                          
   
   l_module           VARCHAR2(50) := 'transfer_employee'; 
   l_department_exist NUMBER;
   
   e_invalid_dept EXCEPTION;
     
   BEGIN
   
    SELECT count(*)
    INTO l_department_exist 
    FROM department
    WHERE department_id = p_department_id;
   
    IF l_department_exist = 0
     THEN RAISE e_invalid_dept;
    ELSE
     UPDATE employee
     SET department_id = p_department_id
     WHERE employee_id = p_employee_id;
    END IF;
    
    
    COMMIT;
    
    EXCEPTION 
      WHEN e_invalid_dept THEN raise_application_error (-20001, 'Invalid department id of : '||p_department_id||'. Module '||l_module);
      WHEN OTHERS THEN raise_application_error (-20001, 'An exception was raised in : '||l_module|| 'error: '||SQLERRM);
   
   END transfer_employee;
   
   
   /***************************************************************************************
   Create an appropriate executable database object to return the Salary for an Employee.
   ***************************************************************************************/

   FUNCTION get_salary (p_employee_id IN employee.employee_id%TYPE 
                       )
    RETURN NUMBER
    
    IS
    l_module VARCHAR2(50) := 'get_salary';  
    l_salary NUMBER; 
    
    BEGIN
     SELECT salary
     INTO l_salary
     FROM employee
     WHERE employee_id = p_employee_id;
    
    
    RETURN l_salary;
    
    EXCEPTION 
      WHEN NO_DATA_FOUND THEN raise_application_error (-20001, 'No salary data found for employee with id of: '||p_employee_id);
      WHEN OTHERS THEN raise_application_error (-20001, 'An exception was raised in : '||l_module|| 'error: '||SQLERRM);
    
    END get_salary;
  
END employee_package;
