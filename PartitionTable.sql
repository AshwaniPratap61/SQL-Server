
--Create a Partition Function
create partition function PartitonByYear (date) 
as range left for values ('2023-12-31', '2024-12-31', '2025-12-31')

-- Check by this Query
select 
    name,
    function_id,
    type,
    type_desc,
    boundary_value_on_right
from sys.partition_functions


-- Create FileGroups
alter database SalesDB add filegroup FG_2023;
alter database SalesDB add filegroup FG_2024;
alter database SalesDB add filegroup FG_2025;
alter database SalesDB add filegroup FG_2026;

-- alter database SalesDB remove filegroup FG_2026;  --remove the Filegroup

select 
*
from sys.filegroups
where type = 'FG'



-- Create .ndf file inside FileGroups

 -- for file 2023
alter database SalesDB add file (
    name = 'P_2023',
    filename = 'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA/P_2023.ndf'
) to filegroup FG_2023;

-- for file 2024
alter database SalesDB add file (
    name = 'P_2024',
    filename = 'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA/P_2024.ndf'
) to filegroup FG_2024;

-- for file 2025
alter database SalesDB add file (
    name = 'P_2025',
    filename = 'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA/P_2025.ndf'
) to filegroup FG_2025;

-- for file 2026
alter database SalesDB add file (
    name = 'P_2026',
    filename = 'C:\Program Files\Microsoft SQL Server\MSSQL17.MSSQLSERVER\MSSQL\DATA/P_2026.ndf'
) to filegroup FG_2026;


-- Create Pertiton Scheme
create partition scheme SchemePartitionByYear
as partition PartitonByYear to (FG_2023, FG_2024, FG_2025, FG_2026)


-- Create Table and Insert the data
create table Sales.Orders_partitions(
    OrderID int,
    OrderDate date,
    Sales int
)

insert into Sales.Orders_partitions values(1, '2024-04-29', 23)