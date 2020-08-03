create or replace PACKAGE employee_package AS 
   
   PROCEDURE create_employee(p_employee_name    IN employee.employee_name%TYPE
                            ,p_job_title        IN employee.job_title%TYPE
                            ,p_manager_id       IN employee.manager_id%TYPE
                            ,p_date_hired       IN employee.date_hired%TYPE
                            ,p_salary           IN employee.salary%TYPE
                            ,p_department_id    IN employee.department_id%TYPE
                           ); 
  
  
   PROCEDURE update_salary (p_employee_id IN employee.employee_id%TYPE
                          ,p_adjustment  IN NUMBER
                          );
                          
   PROCEDURE transfer_employee (p_employee_id   IN employee.employee_id%TYPE
                               ,p_department_id IN NUMBER --which department to transfer to
                               );                          
  
   FUNCTION get_salary (p_employee_id IN employee.employee_id%TYPE 
                       )
    RETURN NUMBER;
  
END employee_package;
