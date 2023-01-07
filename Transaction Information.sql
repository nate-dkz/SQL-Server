SELECT 
    OBJECT_NAME(OBJECT_ID) AS TableName,
    last_user_update As LastUpdated, *
FROM 
    sys.dm_db_index_usage_stats
WHERE 
    database_id = DB_ID( 'NorthWind')
ORDER BY 
    LastUpdated
DESC;