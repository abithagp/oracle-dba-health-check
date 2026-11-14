-- Sessions that are blocked, and who is blocking them
SELECT blocking_session, sid, serial#, username, event, seconds_in_wait
FROM v$session
WHERE blocking_session IS NOT NULL;
