with has_parent as (
	select node, count(*) as amount
	from nodes
	where parent is not NULL
	group by node
),
has_child as (
	select parent, count(*) as amount
	from nodes
	group by parent
)
select
nd.node,
case
when hp.amount > 0 and hc.amount > 0 then "batang"
when hp.amount > 0 then "daun"
else "akar"
end as position
from nodes nd
left join has_parent hp on nd.node = hp.node
left join has_child hc on nd.node = hc.parent
order by 1