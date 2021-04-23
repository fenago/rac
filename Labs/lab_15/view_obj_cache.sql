select inst_id, name, type, kept from gv$db_object_cache where name like '%RAC_CACHE%'
and type = 'SEQUENCE'
order by 1,2;
