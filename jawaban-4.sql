with trx_qty as (
	select
	kode_barang,
	case
		when satuan = 'krat' then qty * 24
		when satuan = 'dus' then qty * 30
		else qty
	end as qty
	from tr_so
)
select
nama_product,
sum(qty) as qty
from trx_qty as tq
join ms_product mp 
on mp.kode_produk = tq.kode_barang 
group by kode_barang 
order by 2 desc