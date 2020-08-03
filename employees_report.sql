SELECT e.employee_name
,      d.department_name
,      e.salary
,      e.date_hired
,      m.employee_name AS manager
FROM department d
JOIN employee e ON d.department_id = e.department_id
LEFT JOIN employee m ON e.manager_id = m.employee_id
WHERE d.department_name = :p_department_name
;