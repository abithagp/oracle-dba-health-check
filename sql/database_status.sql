-- Check Oracle database instance status
SELECT instance_name,
       status,
       database_status,
       startup_time
FROM v$instance;
