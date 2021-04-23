col type for a2
col name for a20
col id1_tag for a10
col id2_tag for a10
col description for a40
select type,name,id1_tag, id2_tag,description from v$lock_type where name like '%Sequence%';
