with uniquee as (
	select distinct * from xy	
	where x <= y
),
pair as (
	select x,y from xy
	group by x,y
)
select
uq.x, uq.y
from uniquee as uq
join pair p on uq.x = p.y and uq.y = p.x