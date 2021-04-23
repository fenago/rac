select inst_id,sequence_name,order_flag, nextvalue,cache_size from gv$_sequences
where sequence_name like '%RAC_%ORDER'
order by inst_id,sequence_name;
