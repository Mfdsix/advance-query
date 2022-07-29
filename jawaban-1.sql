with so_pegawai as (
select
nama_pegawai,
count(distinct no_so) as jumlah_so,
target
from tr_so ts 
join ms_pegawai mp
on mp.kode_pegawai = ts.kode_sales
group by kode_sales 
order by nama_pegawai
)
select
*,
case
	when jumlah_so < target then "ya"
	else "tidak"
end as kurang_dari_target

from so_pegawai