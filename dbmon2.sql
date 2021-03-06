!echo 

!echo EVENTS BY USERS ---------------------------------------------------------------------------------------------

--Events caused by users

select ss.username ||', '||ss.sid ||', '||ss.event ||', '||ss.status ||', '||ss.wait_class ||', '||ss.seconds_in_wait ||', '||ss.WAIT_TIME
from v$session ss where ss.username='SOE' and ss.status='ACTIVE'
 and ss.event!='SQL*Net message to client' and ss.wait_time!='-1' and ss.wait_class != 'Idle';



!echo USERS CONNECTED--------------------------------------------------------------------------------------

select 'Number of users: ' || count(sid) as NUMBER_OF_SESSIONS from v$session where username is not null;

