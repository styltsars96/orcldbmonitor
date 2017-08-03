--print current time
select CURRENT_TIMESTAMP
from dual;

!echo EVENTS------------------------------------------------------------------------------------------------

--Events caused by users
select  state, event#, event, sid, username from v$session where username is not null and event is not null;

!echo USERS CONNECTED---------------------------------------------------------------------------------------

--All users (sessions) connected
select sid, machine, username from v$session
where username is not null;









