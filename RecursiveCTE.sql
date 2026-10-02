
with series as (
    select 
        1 as counting

    union all

    select 
        counting + 1
    from series
    where counting <100
)

--Main Query


select
    *
from series
option(maxrecursion 100)  -- To controle the recursion


-- Finding the hierarchy of Employess based on the ManagerID
with cte_employee_her as(
    select 
        EmployeeID,
        FirstName,
        ManagerID,
        1 as Level
    from Sales.Employees
    where ManagerID is null

    union all 

    select
        e.EmployeeID,
        e.FirstName,
        e.ManagerID,
        Level +1
    from Sales.Employees e
    inner join cte_employee_her ceh
        on e.ManagerID = ceh.EmployeeID
)


-- Main Query

select
    *
from cte_employee_her
