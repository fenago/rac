select l.inst_id,l.pid,p.program,l.resource_name2,
l.owner_node,l.state,l.blocked,l.blocker
from gv$ges_enqueue l, gv$process p
where resource_name2 like '%SV%'
and p.spid = l.pid
order by 1;
