select inst_id,file#,block#,status,dirty
   from  gv$bh
   where file#=6
   and   block# = 197
   and   status !='free'
   order by 1,2,3;
