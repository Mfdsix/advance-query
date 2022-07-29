with trx_qty as (
	select
	no_entry_so,
	kode_barang,
	case
		when satuan = 'krat' then qty * 24
		when satuan = 'dus' then qty * 30
		else qty
	end as qty
	from tr_so
)
select
vendor, sum(harga_satuan * qty) as amount
from trx_qty ts
join tr_do td on td.no_entry_so = ts.no_entry_so 
join tr_inv ti on ti.no_entry_do = td.no_entry_do
join ms_product mp on mp.kode_produk = ts.kode_barang 
join ms_vendor mv on mv.kode_vendor = mp.kode_vendor 
group by mp.kode_vendor
order by 2 desc