
with Series as(
    -- Anchor Query
    select
        1 as counting
union all
    -- Recursive Query
    select
        counting + 1
    from Series
)

-- Main Query
select 
    *
from Series