{{ config(
    materialized = 'table',
    alias = 'PiyushKTestSIM17'
) }}

select
    emp_id as employee_id,
    initcap(emp_name) as full_name,
    case
        when department = 'IT' then 'Technology'
        when department = 'HR' then 'Human Resources'
        when department = 'Finance' then 'Accounts & Finance'
        when department = 'Marketing' then 'Marketing Team'
        else department
    end as dept_name,
    case
        when salary >= 75000 then 'High Salary'
        when salary between 65000 and 74999 then 'Medium Salary'
        else 'Standard Salary'
    end as salary_category,
    to_varchar(joining_date, 'DD-MON-YYYY') as formatted_joining_date
from "PIYUSHK_DB"."PUBLIC"."EMPLOYEES"
