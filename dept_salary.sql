SELECT SUM(e.salary)
, d.department_name
FROM department d
JOIN employee e ON d.department_id = e.department_id
--WHERE d.department_name = :p_department_name
GROUP BY d.department_name
;