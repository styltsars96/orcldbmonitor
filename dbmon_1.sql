--print current time
select CURRENT_TIMESTAMP
from dual;

!echo EVENTS------------------------------------------------------------------------------------------------

--Events caused by users
select  state, event#, event, sid, username from v$session where username is not null and event is not null;

!echo USERS CONNECTED--------------------------------------------------------------------------------------

select 'Number of users: ' || count(sid) as NUMBER_OF_SESSIONS from v$session where username is not null;

--All users (sessions) connected
select sid, machine, username, server, module from v$session
where username is not null;









