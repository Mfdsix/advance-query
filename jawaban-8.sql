with extraction as (
select
regexp_substr(strdata, '[0-9]{4}-[0-9]{2}-[0-9]{2}') as tanggal,
regexp_substr(strdata, '(?<=terjual )([0-9]*)')  as qty,
regexp_substr(strdata, '(?<=[0-9].)(lusin|buah)')  as unit,
cast(regexp_substr(strdata, '(?<=Rp )[0-9]*') as SIGNED) as total
from strdata
)
select
tanggal,
case
	when unit = 'lusin' then qty * 12
	else qty
end as satuan,
case
	when unit = 'lusin' then total / 12 * qty
	else total / qty
end as harga_satuan,
total
from extraction
