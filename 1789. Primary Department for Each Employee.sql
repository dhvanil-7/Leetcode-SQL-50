SELECT
    employee_id,
    department_id
FROM employee
WHERE primary_flag = "Y"
UNION
SELECT
    employee_id,
    department_id
FROM employee
WHERE primary_flag = "N"
    AND (employee_id in (
        select
            employee_id
        from employee
        group by employee_id
        having count(employee_id) = 1
        ))
