-- RMAN backup jobs in the last 7 days
SELECT session_key,
       input_type,
       status,
       TO_CHAR(start_time, 'YYYY-MM-DD HH24:MI') AS start_time,
       TO_CHAR(end_time, 'YYYY-MM-DD HH24:MI') AS end_time,
       ROUND(elapsed_seconds / 60, 1) AS elapsed_min
FROM v$rman_backup_job_details
WHERE start_time > SYSDATE - 7
ORDER BY start_time DESC;
