CREATE TABLE employee(
    employee_id      NUMBER NOT NULL,
    employee_name    VARCHAR2(50) NOT NULL,
    job_title        VARCHAR2(50) NOT NULL,
    manager_id       NUMBER,
    date_hired       DATE NOT NULL,
    salary           NUMBER NOT NULL,
    department_id    NUMBER NOT NULL,
    PRIMARY KEY(employee_id),
    CONSTRAINT department_fk FOREIGN KEY (department_id) REFERENCES department (department_id)
    
);

    COMMENT ON COLUMN employee.employee_id IS 'The unique identifier for the employee';
    COMMENT ON COLUMN employee.employee_name IS 'The name of the employee';
    COMMENT ON COLUMN employee.job_title IS 'The job role undertaken by the employee. Some employees may undertaken the same job role';
    COMMENT ON COLUMN employee.manager_id IS 'Line manager of the employee';
    COMMENT ON COLUMN employee.date_hired IS 'The date the employee was hired';
    COMMENT ON COLUMN employee.salary IS 'Current salary of the employee';
    COMMENT ON COLUMN employee.department_id IS 'Each employee must belong to a department';