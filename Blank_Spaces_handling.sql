use SalesDB

select 
	ShipAddress,
	BillAddress,
	trim(BillAddress) as policy1_trim,
	len(trim(BillAddress)) as policy2_len_check,
	nullif(BillAddress, '') policy3_null_conversion,
	coalesce(nullif(BillAddress, ''),ShipAddress, '''N/A''' ) as final_BillAddress
from Sales.Orders