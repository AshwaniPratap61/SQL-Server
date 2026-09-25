# SQL Practice & Data Cleaning

A hands-on collection of SQL queries built while learning and practicing data analysis with Microsoft SQL Server.

The focus is not only on writing queries, but on understanding the data, validating assumptions, handling data-quality issues, and building solutions step by step.

## What This Repository Covers

- SQL querying fundamentals
- Filtering and sorting
- Aggregations and grouping
- `having` and conditional logic
- Joins and relationship handling
- `null` and blank-value handling
- Data cleaning and transformation
- Query formatting and readability
- Practical problem-solving with relational data

## Approach

For each problem, the goal is to follow a simple process:

**Understand → Inspect → Build → Validate → Transform**

Rather than jumping directly to a final query, intermediate checks are used when necessary to understand the underlying data and verify the result.

### Example: Handling Blank and NULL Addresses

```sql
select
	ShipAddress,
	BillAddress,
	trim(BillAddress) as policy1_trim,
	len(trim(BillAddress)) as policy2_len_check,
	nullif(BillAddress, '') as policy3_null_conversion,
	coalesce(
		nullif(BillAddress, ''),
		ShipAddress,
		'N/A'
	) as final_BillAddress
from Sales.Orders;
```

This example demonstrates:

1. Inspecting whitespace with `trim()`
2. Verifying the cleaned value with `len()`
3. Converting empty strings to `null` using `nullif()`
4. Creating a fallback hierarchy with `coalesce()`

## Repository Structure

```text
sql-practice/
│
├── README.md
├── basics.sql
├── aggregations.sql
├── joins.sql
└── data_cleaning.sql
```

The repository will grow as new SQL concepts and practical exercises are completed.

## Tools

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Visual Studio Code
- Microsoft SQL Server (`mssql`) extension
- Git
- GitHub

## Purpose

This repository documents my SQL learning process and serves as a record of practical problem-solving, data-cleaning techniques, and progressively more advanced SQL work.
