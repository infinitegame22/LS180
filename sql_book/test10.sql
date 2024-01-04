/*
CoderPad provides a basic SQL sandbox with the following schema.
You can also use commands like '\dt;' and '\d employees;'

employees                             projects
+---------------+---------+           +---------------+---------+
| id            | int     |<----+  +->| id            | int     |
| first_name    | varchar |     |  |  | title         | varchar |
| last_name     | varchar |     |  |  | start_date    | date    |
| salary        | int     |     |  |  | end_date      | date    |
| department_id | int     |--+  |  |  | budget        | int     |
+---------------+---------+  |  |  |  +---------------+---------+
                             |  |  |
departments                  |  |  |  employees_projects
+---------------+---------+  |  |  |  +---------------+---------+
| id            | int     |<-+  |  +--| project_id    | int     |
| name          | varchar |     +-----| employee_id   | int     |
+---------------+---------+           +---------------+---------+
*/

-- SELECT e.first_name, e.last_name, e.salary,
--   d.name as department_name
-- FROM employees   AS e
-- JOIN departments AS d ON e.department_id = d.id;


-- FlapJacks Wakeup Groggy, Hurling Campbells soup@ Loggers.

-- FROM-JOIN
-- WHERE
-- GROUP BY
-- HAVING
-- COMPUTE FUNCTIONS AND ALIAS COLUMNS/SELECT COLUMNS
-- SORT BY -- ORDER BY
-- LIMIT/OFFSET

-- \d

-- \d departments

-- select * from departments;

-- select * from employees;

-- select * from departments, employees;

-- SELECT * FROM departments
-- CROSS JOIN employees;



-- SELECT * FROM departments
-- JOIN employees ON department_id = departments.id;

-- \d employees

SELECT string_agg(concat(first_name, ' ', last_name), ', ') AS "Employees", departments."name" AS "Department"
FROM employees
         JOIN departments ON departments.id = employees.department_id
GROUP BY "Department"
ORDER BY "Department";

-- CREATE SEQUENCE departments_id_seq;

-- CREATE TABLE new {
--   id int PRIMARY KEY DEFAULT nextval('departments_id_seq'),
--   id serial PRIMARY KEY
-- }

JD ran 37 lines of PostgreSQL (finished in 124ms):

                 List of relations
 Schema |        Name        |   Type   |  Owner
--------+--------------------+----------+----------
 public | departments        | table    | coderpad
 public | departments_id_seq | sequence | coderpad
 public | employees          | table    | coderpad
 public | employees_id_seq   | sequence | coderpad
 public | employees_projects | table    | coderpad
 public | projects           | table    | coderpad
 public | projects_id_seq    | sequence | coderpad
(7 rows)


coderpad=#

JD ran 37 lines of PostgreSQL (finished in 115ms):

               List of relations
 Schema |        Name        | Type  |  Owner
--------+--------------------+-------+----------
 public | departments        | table | coderpad
 public | employees          | table | coderpad
 public | employees_projects | table | coderpad
 public | projects           | table | coderpad
(4 rows)


coderpad=#

JD ran 46 lines of PostgreSQL (finished in 162ms):

                 List of relations
 Schema |        Name        |   Type   |  Owner
--------+--------------------+----------+----------
 public | departments        | table    | coderpad
 public | departments_id_seq | sequence | coderpad
 public | employees          | table    | coderpad
 public | employees_id_seq   | sequence | coderpad
 public | employees_projects | table    | coderpad
 public | projects           | table    | coderpad
 public | projects_id_seq    | sequence | coderpad
(7 rows)

Table "public.departments"
Column |          Type          | Collation | Nullable |                 Default
--------+------------------------+-----------+----------+-----------------------------------------
 id     | integer                |           | not null | nextval('departments_id_seq'::regclass)
 name   | character varying(255) |           |          |
Indexes:
    "departments_pkey" PRIMARY KEY, btree (id)
Referenced by:
TABLE "employees" CONSTRAINT "employees_department_id_fkey" FOREIGN KEY (department_id) REFERENCES departments(id)


coderpad=#

JD ran 51 lines of PostgreSQL (finished in 113ms):

                 List of relations
 Schema |        Name        |   Type   |  Owner
--------+--------------------+----------+----------
 public | departments        | table    | coderpad
 public | departments_id_seq | sequence | coderpad
 public | employees          | table    | coderpad
 public | employees_id_seq   | sequence | coderpad
 public | employees_projects | table    | coderpad
 public | projects           | table    | coderpad
 public | projects_id_seq    | sequence | coderpad
(7 rows)

Table "public.departments"
Column |          Type          | Collation | Nullable |                 Default
--------+------------------------+-----------+----------+-----------------------------------------
 id     | integer                |           | not null | nextval('departments_id_seq'::regclass)
 name   | character varying(255) |           |          |
Indexes:
    "departments_pkey" PRIMARY KEY, btree (id)
Referenced by:
TABLE "employees" CONSTRAINT "employees_department_id_fkey" FOREIGN KEY (department_id) REFERENCES departments(id)

 id |    name
----+-------------
  1 | Reporting
  2 | Engineering
  3 | Marketing
  4 | Biz Dev
  5 | Silly Walks
(5 rows)

psql:solution.sql:43: ERROR:  syntax error at or near "employees"
LINE 1: select * employees;
^

coderpad=#

JD ran 51 lines of PostgreSQL (finished in 128ms):

                 List of relations
 Schema |        Name        |   Type   |  Owner
--------+--------------------+----------+----------
 public | departments        | table    | coderpad
 public | departments_id_seq | sequence | coderpad
 public | employees          | table    | coderpad
 public | employees_id_seq   | sequence | coderpad
 public | employees_projects | table    | coderpad
 public | projects           | table    | coderpad
 public | projects_id_seq    | sequence | coderpad
(7 rows)

Table "public.departments"
Column |          Type          | Collation | Nullable |                 Default
--------+------------------------+-----------+----------+-----------------------------------------
 id     | integer                |           | not null | nextval('departments_id_seq'::regclass)
 name   | character varying(255) |           |          |
Indexes:
    "departments_pkey" PRIMARY KEY, btree (id)
Referenced by:
TABLE "employees" CONSTRAINT "employees_department_id_fkey" FOREIGN KEY (department_id) REFERENCES departments(id)

 id |    name
----+-------------
  1 | Reporting
  2 | Engineering
  3 | Marketing
  4 | Biz Dev
  5 | Silly Walks
(5 rows)

 id | first_name | last_name | salary | department_id
----+------------+-----------+--------+---------------
  1 | John       | Smith     |  20000 |             1
  2 | Ava        | Muffinson |  10000 |             5
  3 | Cailin     | Ninson    |  30000 |             2
  4 | Mike       | Peterson  |  20000 |             2
  5 | Ian        | Peterson  |  80000 |             2
  6 | John       | Mills     |  50000 |             3
(6 rows)


coderpad=#

JD ran 54 lines of PostgreSQL (finished in 117ms):

                 List of relations
 Schema |        Name        |   Type   |  Owner
--------+--------------------+----------+----------
 public | departments        | table    | coderpad
 public | departments_id_seq | sequence | coderpad
 public | employees          | table    | coderpad
 public | employees_id_seq   | sequence | coderpad
 public | employees_projects | table    | coderpad
 public | projects           | table    | coderpad
 public | projects_id_seq    | sequence | coderpad
(7 rows)

Table "public.departments"
Column |          Type          | Collation | Nullable |                 Default
--------+------------------------+-----------+----------+-----------------------------------------
 id     | integer                |           | not null | nextval('departments_id_seq'::regclass)
 name   | character varying(255) |           |          |
Indexes:
    "departments_pkey" PRIMARY KEY, btree (id)
Referenced by:
TABLE "employees" CONSTRAINT "employees_department_id_fkey" FOREIGN KEY (department_id) REFERENCES departments(id)

 id |    name     | id | first_name | last_name | salary | department_id
----+-------------+----+------------+-----------+--------+---------------
  1 | Reporting   |  1 | John       | Smith     |  20000 |             1
  1 | Reporting   |  2 | Ava        | Muffinson |  10000 |             5
  1 | Reporting   |  3 | Cailin     | Ninson    |  30000 |             2
  1 | Reporting   |  4 | Mike       | Peterson  |  20000 |             2
  1 | Reporting   |  5 | Ian        | Peterson  |  80000 |             2
  1 | Reporting   |  6 | John       | Mills     |  50000 |             3
  2 | Engineering |  1 | John       | Smith     |  20000 |             1
  2 | Engineering |  2 | Ava        | Muffinson |  10000 |             5
  2 | Engineering |  3 | Cailin     | Ninson    |  30000 |             2
  2 | Engineering |  4 | Mike       | Peterson  |  20000 |             2
  2 | Engineering |  5 | Ian        | Peterson  |  80000 |             2
  2 | Engineering |  6 | John       | Mills     |  50000 |             3
  3 | Marketing   |  1 | John       | Smith     |  20000 |             1
  3 | Marketing   |  2 | Ava        | Muffinson |  10000 |             5
  3 | Marketing   |  3 | Cailin     | Ninson    |  30000 |             2
  3 | Marketing   |  4 | Mike       | Peterson  |  20000 |             2
  3 | Marketing   |  5 | Ian        | Peterson  |  80000 |             2
  3 | Marketing   |  6 | John       | Mills     |  50000 |             3
  4 | Biz Dev     |  1 | John       | Smith     |  20000 |             1
  4 | Biz Dev     |  2 | Ava        | Muffinson |  10000 |             5
  4 | Biz Dev     |  3 | Cailin     | Ninson    |  30000 |             2
  4 | Biz Dev     |  4 | Mike       | Peterson  |  20000 |             2
  4 | Biz Dev     |  5 | Ian        | Peterson  |  80000 |             2
  4 | Biz Dev     |  6 | John       | Mills     |  50000 |             3
  5 | Silly Walks |  1 | John       | Smith     |  20000 |             1
  5 | Silly Walks |  2 | Ava        | Muffinson |  10000 |             5
  5 | Silly Walks |  3 | Cailin     | Ninson    |  30000 |             2
  5 | Silly Walks |  4 | Mike       | Peterson  |  20000 |             2
  5 | Silly Walks |  5 | Ian        | Peterson  |  80000 |             2
  5 | Silly Walks |  6 | John       | Mills     |  50000 |             3
(30 rows)


coderpad=#

JD ran 55 lines of PostgreSQL (finished in 109ms):

                 List of relations
 Schema |        Name        |   Type   |  Owner
--------+--------------------+----------+----------
 public | departments        | table    | coderpad
 public | departments_id_seq | sequence | coderpad
 public | employees          | table    | coderpad
 public | employees_id_seq   | sequence | coderpad
 public | employees_projects | table    | coderpad
 public | projects           | table    | coderpad
 public | projects_id_seq    | sequence | coderpad
(7 rows)

Table "public.departments"
Column |          Type          | Collation | Nullable |                 Default
--------+------------------------+-----------+----------+-----------------------------------------
 id     | integer                |           | not null | nextval('departments_id_seq'::regclass)
 name   | character varying(255) |           |          |
Indexes:
    "departments_pkey" PRIMARY KEY, btree (id)
Referenced by:
TABLE "employees" CONSTRAINT "employees_department_id_fkey" FOREIGN KEY (department_id) REFERENCES departments(id)

 id |    name     | id | first_name | last_name | salary | department_id
----+-------------+----+------------+-----------+--------+---------------
  1 | Reporting   |  1 | John       | Smith     |  20000 |             1
  2 | Engineering |  5 | Ian        | Peterson  |  80000 |             2
  2 | Engineering |  4 | Mike       | Peterson  |  20000 |             2
  2 | Engineering |  3 | Cailin     | Ninson    |  30000 |             2
  3 | Marketing   |  6 | John       | Mills     |  50000 |             3
  5 | Silly Walks |  2 | Ava        | Muffinson |  10000 |             5
(6 rows)


coderpad=#

JD ran 58 lines of PostgreSQL (finished in 120ms):

                 List of relations
 Schema |        Name        |   Type   |  Owner
--------+--------------------+----------+----------
 public | departments        | table    | coderpad
 public | departments_id_seq | sequence | coderpad
 public | employees          | table    | coderpad
 public | employees_id_seq   | sequence | coderpad
 public | employees_projects | table    | coderpad
 public | projects           | table    | coderpad
 public | projects_id_seq    | sequence | coderpad
(7 rows)

Table "public.departments"
Column |          Type          | Collation | Nullable |                 Default
--------+------------------------+-----------+----------+-----------------------------------------
 id     | integer                |           | not null | nextval('departments_id_seq'::regclass)
 name   | character varying(255) |           |          |
Indexes:
    "departments_pkey" PRIMARY KEY, btree (id)
Referenced by:
TABLE "employees" CONSTRAINT "employees_department_id_fkey" FOREIGN KEY (department_id) REFERENCES departments(id)

 id |    name     | id | first_name | last_name | salary | department_id
----+-------------+----+------------+-----------+--------+---------------
  1 | Reporting   |  1 | John       | Smith     |  20000 |             1
  2 | Engineering |  5 | Ian        | Peterson  |  80000 |             2
  2 | Engineering |  4 | Mike       | Peterson  |  20000 |             2
  2 | Engineering |  3 | Cailin     | Ninson    |  30000 |             2
  3 | Marketing   |  6 | John       | Mills     |  50000 |             3
  5 | Silly Walks |  2 | Ava        | Muffinson |  10000 |             5
(6 rows)

 id |    name     | id | first_name | last_name | salary | department_id
----+-------------+----+------------+-----------+--------+---------------
  1 | Reporting   |  1 | John       | Smith     |  20000 |             1
  2 | Engineering |  5 | Ian        | Peterson  |  80000 |             2
  2 | Engineering |  4 | Mike       | Peterson  |  20000 |             2
  2 | Engineering |  3 | Cailin     | Ninson    |  30000 |             2
  3 | Marketing   |  6 | John       | Mills     |  50000 |             3
  5 | Silly Walks |  2 | Ava        | Muffinson |  10000 |             5
(6 rows)


coderpad=#

JD ran 62 lines of PostgreSQL (finished in 119ms):

                 List of relations
 Schema |        Name        |   Type   |  Owner
--------+--------------------+----------+----------
 public | departments        | table    | coderpad
 public | departments_id_seq | sequence | coderpad
 public | employees          | table    | coderpad
 public | employees_id_seq   | sequence | coderpad
 public | employees_projects | table    | coderpad
 public | projects           | table    | coderpad
 public | projects_id_seq    | sequence | coderpad
(7 rows)

Table "public.departments"
Column |          Type          | Collation | Nullable |                 Default
--------+------------------------+-----------+----------+-----------------------------------------
 id     | integer                |           | not null | nextval('departments_id_seq'::regclass)
 name   | character varying(255) |           |          |
Indexes:
    "departments_pkey" PRIMARY KEY, btree (id)
Referenced by:
TABLE "employees" CONSTRAINT "employees_department_id_fkey" FOREIGN KEY (department_id) REFERENCES departments(id)

 id |    name     | id | first_name | last_name | salary | department_id
----+-------------+----+------------+-----------+--------+---------------
  1 | Reporting   |  1 | John       | Smith     |  20000 |             1
  1 | Reporting   |  2 | Ava        | Muffinson |  10000 |             5
  1 | Reporting   |  3 | Cailin     | Ninson    |  30000 |             2
  1 | Reporting   |  4 | Mike       | Peterson  |  20000 |             2
  1 | Reporting   |  5 | Ian        | Peterson  |  80000 |             2
  1 | Reporting   |  6 | John       | Mills     |  50000 |             3
  2 | Engineering |  1 | John       | Smith     |  20000 |             1
  2 | Engineering |  2 | Ava        | Muffinson |  10000 |             5
  2 | Engineering |  3 | Cailin     | Ninson    |  30000 |             2
  2 | Engineering |  4 | Mike       | Peterson  |  20000 |             2
  2 | Engineering |  5 | Ian        | Peterson  |  80000 |             2
  2 | Engineering |  6 | John       | Mills     |  50000 |             3
  3 | Marketing   |  1 | John       | Smith     |  20000 |             1
  3 | Marketing   |  2 | Ava        | Muffinson |  10000 |             5
  3 | Marketing   |  3 | Cailin     | Ninson    |  30000 |             2
  3 | Marketing   |  4 | Mike       | Peterson  |  20000 |             2
  3 | Marketing   |  5 | Ian        | Peterson  |  80000 |             2
  3 | Marketing   |  6 | John       | Mills     |  50000 |             3
  4 | Biz Dev     |  1 | John       | Smith     |  20000 |             1
  4 | Biz Dev     |  2 | Ava        | Muffinson |  10000 |             5
  4 | Biz Dev     |  3 | Cailin     | Ninson    |  30000 |             2
  4 | Biz Dev     |  4 | Mike       | Peterson  |  20000 |             2
  4 | Biz Dev     |  5 | Ian        | Peterson  |  80000 |             2
  4 | Biz Dev     |  6 | John       | Mills     |  50000 |             3
  5 | Silly Walks |  1 | John       | Smith     |  20000 |             1
  5 | Silly Walks |  2 | Ava        | Muffinson |  10000 |             5
  5 | Silly Walks |  3 | Cailin     | Ninson    |  30000 |             2
  5 | Silly Walks |  4 | Mike       | Peterson  |  20000 |             2
  5 | Silly Walks |  5 | Ian        | Peterson  |  80000 |             2
  5 | Silly Walks |  6 | John       | Mills     |  50000 |             3
(30 rows)


coderpad=#

JD ran 62 lines of PostgreSQL (finished in 129ms):

Table "public.employees"
Column     |          Type          | Collation | Nullable |                Default
---------------+------------------------+-----------+----------+---------------------------------------
 id            | integer                |           | not null | nextval('employees_id_seq'::regclass)
 first_name    | character varying(255) |           |          |
 last_name     | character varying(255) |           |          |
 salary        | integer                |           |          |
 department_id | integer                |           |          |
Indexes:
    "employees_pkey" PRIMARY KEY, btree (id)
Foreign-key constraints:
    "employees_department_id_fkey" FOREIGN KEY (department_id) REFERENCES departments(id)
Referenced by:
TABLE "employees_projects" CONSTRAINT "employees_projects_employee_id_fkey" FOREIGN KEY (employee_id) REFERENCES employees(id)


coderpad=#

JD ran 66 lines of PostgreSQL (finished in 106ms):

 first_name | last_name |    name
------------+-----------+-------------
 John       | Smith     | Reporting
 Ian        | Peterson  | Engineering
 Mike       | Peterson  | Engineering
 Cailin     | Ninson    | Engineering
 John       | Mills     | Marketing
 Ava        | Muffinson | Silly Walks
(6 rows)


coderpad=#

JD ran 66 lines of PostgreSQL (finished in 138ms):

 first_name | last_name |    name
------------+-----------+-------------
 John       | Smith     | Reporting
 Ian        | Peterson  | Engineering
 Mike       | Peterson  | Engineering
 Cailin     | Ninson    | Engineering
 John       | Mills     | Marketing
 Ava        | Muffinson | Silly Walks
(6 rows)


coderpad=#

JD ran 66 lines of PostgreSQL (finished in 108ms):

 first_name | last_name |    name
------------+-----------+-------------
 John       | Smith     | Reporting
 Ian        | Peterson  | Engineering
 Mike       | Peterson  | Engineering
 Cailin     | Ninson    | Engineering
 John       | Mills     | Marketing
            |           | Biz Dev
 Ava        | Muffinson | Silly Walks
(7 rows)


coderpad=#

JD ran 66 lines of PostgreSQL (finished in 125ms):

psql:solution.sql:59: ERROR:  syntax error at or near "OUTER"
LINE 44: OUTER JOIN departments ON departments.id = employees.departm...
         ^

coderpad=#

JD ran 66 lines of PostgreSQL (finished in 115ms):

 first_name | last_name |    name
------------+-----------+-------------
 John       | Smith     | Reporting
 Ian        | Peterson  | Engineering
 Mike       | Peterson  | Engineering
 Cailin     | Ninson    | Engineering
 John       | Mills     | Marketing
            |           | Biz Dev
 Ava        | Muffinson | Silly Walks
(7 rows)


coderpad=#

JD ran 66 lines of PostgreSQL (finished in 97ms):

 first_name | last_name |    name
------------+-----------+-------------
 John       | Smith     | Reporting
 Ian        | Peterson  | Engineering
 Mike       | Peterson  | Engineering
 Cailin     | Ninson    | Engineering
 John       | Mills     | Marketing
            |           | Biz Dev
 Ava        | Muffinson | Silly Walks
(7 rows)


coderpad=#

JD ran 66 lines of PostgreSQL (finished in 109ms):

 first_name | last_name |    name
------------+-----------+-------------
 John       | Smith     | Reporting
 Ian        | Peterson  | Engineering
 Mike       | Peterson  | Engineering
 Cailin     | Ninson    | Engineering
 John       | Mills     | Marketing
 Ava        | Muffinson | Silly Walks
(6 rows)


coderpad=#

JD ran 66 lines of PostgreSQL (finished in 101ms):

 first_name | last_name |    name
------------+-----------+-------------
 John       | Smith     | Reporting
 Ian        | Peterson  | Engineering
 Mike       | Peterson  | Engineering
 Cailin     | Ninson    | Engineering
 John       | Mills     | Marketing
            |           | Biz Dev
 Ava        | Muffinson | Silly Walks
(7 rows)


coderpad=#

JD ran 66 lines of PostgreSQL (finished in 99ms):

psql:solution.sql:59: ERROR:  syntax error at or near "INNER"
LINE 44: RIGHT INNER JOIN departments ON departments.id = employees.d...
               ^

coderpad=#

JD ran 66 lines of PostgreSQL (finished in 96ms):

 first_name | last_name |    name
------------+-----------+-------------
 John       | Smith     | Reporting
 Ian        | Peterson  | Engineering
 Mike       | Peterson  | Engineering
 Cailin     | Ninson    | Engineering
 John       | Mills     | Marketing
 Ava        | Muffinson | Silly Walks
(6 rows)


coderpad=#

JD ran 66 lines of PostgreSQL (finished in 118ms):

 first_name | last_name | Department
------------+-----------+-------------
 John       | Smith     | Reporting
 Ian        | Peterson  | Engineering
 Mike       | Peterson  | Engineering
 Cailin     | Ninson    | Engineering
 John       | Mills     | Marketing
 Ava        | Muffinson | Silly Walks
(6 rows)


coderpad=#

JD ran 67 lines of PostgreSQL (finished in 95ms):

 first_name | last_name | Department
------------+-----------+-------------
 Ian        | Peterson  | Engineering
 Mike       | Peterson  | Engineering
 Cailin     | Ninson    | Engineering
 John       | Mills     | Marketing
 John       | Smith     | Reporting
 Ava        | Muffinson | Silly Walks
(6 rows)


coderpad=#

JD ran 68 lines of PostgreSQL (finished in 105ms):

                 string_agg                 | Department
--------------------------------------------+-------------
 Ian Peterson, Mike Peterson, Cailin Ninson | Engineering
 John Mills                                 | Marketing
 John Smith                                 | Reporting
 Ava Muffinson                              | Silly Walks
(4 rows)


coderpad=#

JD ran 68 lines of PostgreSQL (finished in 125ms):

                 Employees                  | Department
--------------------------------------------+-------------
 Ian Peterson, Mike Peterson, Cailin Ninson | Engineering
 John Mills                                 | Marketing
 John Smith                                 | Reporting
 Ava Muffinson                              | Silly Walks
(4 rows)