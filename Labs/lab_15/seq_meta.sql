select inst_id,sequence_name,
active_flag,replenish_flag,wrap_flag,cycle_flag,order_flag,
min_value,nextvalue,increment_by,cache_size
from gv$_sequences
where sequence_name like '%RAC%'
order by inst_id,sequence_name;
