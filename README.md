# \# Oracle DBA Daily Health Check Toolkit

# 

# Shell and SQL scripts for the daily checks an Oracle DBA performs: instance status, tablespace usage, RMAN backups, invalid objects, blocking sessions and Fast Recovery Area usage.

# 

# \## Prerequisites

# \- Linux server with Oracle Database 12c/19c

# \- `sqlplus` available and OS authentication (`/ as sysdba`)

# 

# \## Usage

# ```bash

# chmod +x run\_health\_check.sh

# ORACLE\_SID=ORCL ./run\_health\_check.sh

# ```

# A dated report is saved in the `reports/` folder.

# 

# \## Checks included

# | Script | Purpose |

# |---|---|

# | database\_status.sql | Instance and database status |

# | tablespace\_usage.sql | Tablespace size and % used |

# | rman\_backup\_status.sql | RMAN jobs in the last 7 days |

# | invalid\_objects.sql | Invalid objects by owner and type |

# | blocking\_sessions.sql | Blocked sessions and blockers |

# | fra\_usage.sql | Fast Recovery Area usage |

# 

# \## Scheduling with cron

# ```

# 0 7 \* \* \* cd /home/oracle/oracle-dba-health-check \&\& ./run\_health\_check.sh

# ```

# 

# \## Notes

# The tablespace query does not account for autoextend headroom.

