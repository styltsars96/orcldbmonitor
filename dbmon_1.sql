--print current time
select CURRENT_TIMESTAMP
from dual;

--All users (sessions) connected
select sid, serial#, username, osuser, machine from v$session
where username is not null;

--WAIT EVENTS - associate the waits (system events) with our wait classes...
Select a.event, a.total_waits, a.time_waited, a.average_wait
From v$system_event a, v$event_name b, v$system_wait_class c
Where a.event_id=b.event_id
And b.wait_class#=c.wait_class#
And c.wait_class in ('Application','Concurrency')--exluding idle waits
order by average_wait desc;





