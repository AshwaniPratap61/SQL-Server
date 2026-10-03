-- This Query is used to generate the report of the customer by using the 
-- CTE methods.

-- TotalSales CTE
with cte_total_sales as(
	select 
		CustomerID,
		sum(Sales) TotalSales
	from Sales.Orders
	group by CUstomerID
)
-- Customer Last Order CTE
, cte_last_order as (
	select
		CustomerID,
		max(OrderDate) LastOrder
	from Sales.Orders
	group by CustomerID
)
-- Custoemer Rank CTE
, cte_rank_customers as (
	select
		CustomerID,
		TotalSales,  		
		rank() over(order by TotalSales desc) as CustomerRank
	from cte_total_sales
)

-- CTE Customer Segment
, cte_customer_segement as(
	select 
		CustomerID,
		TotalSales,
		case
			when TotalSales >100 then 'High'
			when TotalSales >50 then 'Medium'
			else 'Low'
		end CustomerSegements
	from cte_total_sales
)

-- Main Query
select
	c.CustomerID,
	c.FirstName,
	c.LastName,
	c.Score,
	cts.TotalSales,
	clo.LastOrder,
	crc.CustomerRank,
	ccs.CustomerSegements
from Sales.Customers c
left join cte_total_sales cts
	on c.CustomerID = cts.CustomerID
left join cte_last_order clo
	on c.CustomerID = clo.CustomerID
left join cte_rank_customers crc
	on c.CustomerID = crc.CustomerID
left join cte_customer_segement ccs
	on c.CustomerID = ccs.CustomerID