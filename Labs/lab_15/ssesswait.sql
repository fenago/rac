rem  show all sessions
set numwidth 8
col event for a27
col p1text for a10
col p2text for a10
col p3text for a10
pause first show the event and parameters
select sid, seq#,event,
p1text,p1,p1raw,
p2text,p2,p2raw
from v$session_wait
order by event;
pause now look at the timing
select sid,seq#,event,
wait_time,seconds_in_wait,state
from v$session_wait
order by event;
