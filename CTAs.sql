

if object_id('Sales.MonthlyOrders', 'U') is not NULL
    drop table Sales.MonthlyOrders
go   -- T-SQL

select 
    datename(month, OrderDate) as months,
    count(OrderID) as TotalOrders
into Sales.MonthlyOrders
from Sales.Orders
group by datename(month, OrderDate)



-- Main Query

select * from Sales.MonthlyOrders