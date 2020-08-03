CREATE TABLE department(
    department_id         NUMBER NOT NULL,
    department_name       VARCHAR2(50) NOT NULL,
    location              VARCHAR2(50) NOT NULL,
    PRIMARY KEY(department_id)
);

    COMMENT ON COLUMN department.department_id IS 'The unique identifier for the department';
    COMMENT ON COLUMN department.department_name IS 'The name of the department';
    COMMENT ON COLUMN department.location IS 'The physical location of the department';