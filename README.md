# Oracle DBA Daily Health Check Toolkit

Shell and SQL scripts for the daily checks an Oracle DBA performs: instance status, tablespace usage, RMAN backups, invalid objects, blocking sessions and Fast Recovery Area usage.

## Prerequisites
- Linux server with Oracle Database 12c/19c
- `sqlplus` available and OS authentication (`/ as sysdba`)

## Usage
```bash
chmod +x run_health_check.sh
ORACLE_SID=ORCL ./run_health_check.sh
```
A dated report is saved in the `reports/` folder.

## Checks included
| Script | Purpose |
|---|---|
| database_status.sql | Instance and database status |
| tablespace_usage.sql | Tablespace size and % used |
| rman_backup_status.sql | RMAN jobs in the last 7 days |
| invalid_objects.sql | Invalid objects by owner and type |
| blocking_sessions.sql | Blocked sessions and blockers |
| fra_usage.sql | Fast Recovery Area usage |

## Scheduling with cron
```
0 7 * * * cd /home/oracle/oracle-dba-health-check && ./run_health_check.sh
```

## Notes
The tablespace query does not account for autoextend headroom.
