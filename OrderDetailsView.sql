
-- This Table View Displays all the relevant Order Details

create view Sales.v_OrderDetails as
(
	select
		o.OrderID,
		O.OrderDate,
		p.Product,
		p.Category,
		o.Quantity,
		p.Price,
		o.Sales,
		coalesce(c.FirstName, '') + ' ' + coalesce(c.LastName, '') as CustomerName,
		c.CustomerID,
		coalesce(e.FirstName, '') + ' ' + coalesce(e.LastName, '') as SalesPersonName,
		e.EmployeeID,
		e.Department
	from Sales.Orders o
	inner join Sales.Products p
		on o.ProductID = p.ProductID
	inner join Sales.Customers c
		on o.CustomerID = c.CustomerID
	inner join Sales.Employees e
		on o.SalesPersonID = e.EmployeeID
)