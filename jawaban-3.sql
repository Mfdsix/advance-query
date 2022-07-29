select
no_do,
nama_customer,
tgl_do,
(select date('2018-02-01')) as date_measurement,
datediff(date('2018-02-01'), date(tgl_do)) as aging
from tr_do td
join tr_so ts
on td.no_entry_so = ts.no_entry_so
join ms_customer mc
on mc.kode_customer = ts.kode_customer
where no_entry_do
not in
(select no_entry_do from tr_inv)
order by tgl_do asc