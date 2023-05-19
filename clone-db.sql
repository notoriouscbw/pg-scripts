/* Kill all existing connections from sourcedb */
SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity
WHERE pg_stat_activity.datname = 'SOURCE_DB' AND pid <> pg_backend_pid();

/* Clone sourcedb to new targetdb */
CREATE DATABASE insert_targetdb_name WITH TEMPLATE insert_sourcedb_name OWNER insert_desired_dbowner;
