--print current time
select CURRENT_TIMESTAMP
from dual;

--All users (sessions) connected
select sid, serial#, username, osuser, machine from v$session
where username is not null;

--WAIT EVENTS - associate the waits (system events) with our wait classes...
Select a.event, a.total_waits, a.time_waited, a.average_wait, average_wait
From v$system_event a, v$event_name b, v$system_wait_class c
Where a.event_id=b.event_id
And b.wait_class#=c.wait_class#
And c.wait_class in ('Application','Concurrency')--exluding idle waits
order by average_wait desc;

--Number of wait events per class
select
count(*),
CASE WHEN state != 'WAITING' THEN 'WORKING'
ELSE 'WAITING'
END AS state,
CASE WHEN state != 'WAITING' THEN 'On CPU / runqueue'
ELSE event
END AS sw_event
FROM
v$session
GROUP BY
CASE WHEN state != 'WAITING' THEN 'WORKING'
ELSE 'WAITING'
END,
CASE WHEN state != 'WAITING' THEN 'On CPU / runqueue'
ELSE event
END
ORDER BY
1 DESC, 2 DESC;
/





