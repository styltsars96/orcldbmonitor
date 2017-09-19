!echo 

!echo EVENTS BY USERS ---------------------------------------------------------------------------------------------

--Events caused by users

select ss.username,ss.sid,ss.type,ss.event,ss.module,ss.status,ss.wait_class,ss.wait_time,ss.WAIT_TIME_MICRO,sq.sql_fulltext,sq.sql_id
from v$session ss JOIN v$sql sq ON (ss.SQL_ID = sq.SQL_ID) where ss.username='SOE' and ss.status='ACTIVE'
 and ss.event!='SQL*Net message to client' and ss.wait_time!='-1';



!echo USERS CONNECTED--------------------------------------------------------------------------------------

select 'Number of users: ' || count(sid) as NUMBER_OF_SESSIONS from v$session where username is not null;

