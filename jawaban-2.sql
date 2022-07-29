select
no_do, kode_customer, tgl_do, qty,
round((110 / 100) * (qty * harga_satuan) + 25000) as amount
from tr_do td
join tr_so ts 
on ts.no_entry_so = td.no_entry_so
join ms_product mp
on mp.kode_produk = ts.kode_barang