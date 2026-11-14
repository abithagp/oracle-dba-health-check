#!/bin/bash
# Runs all SQL checks in sql/ and saves a dated report.
# Usage: ORACLE_SID=ORCL ./run_health_check.sh

export ORACLE_SID=${ORACLE_SID:-ORCL}
REPORT_DIR="./reports"
mkdir -p "$REPORT_DIR"
REPORT="$REPORT_DIR/health_check_$(date +%Y%m%d_%H%M).log"

{
  echo "Health check on $(hostname) at $(date)"
  for f in sql/*.sql; do
    echo
    echo "===== $f ====="
    sqlplus -s / as sysdba <<EOF
SET LINESIZE 200 PAGESIZE 100 FEEDBACK OFF
@$f
EXIT
EOF
  done
} > "$REPORT" 2>&1

echo "Report saved to $REPORT"