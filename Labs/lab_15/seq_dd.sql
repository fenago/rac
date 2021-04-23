col sequence_owner for a14
col sequence_name for a20
select SEQUENCE_NAME, MIN_VALUE, INCREMENT_BY, CYCLE_FLAG, ORDER_FLAG, CACHE_SIZE, LAST_NUMBER from dba_sequences where sequence_name like '%RAC_%ORDER';
