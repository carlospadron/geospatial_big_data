SELECT
    *
FROM
    GIS.OSM.PLANET_INTERNAL
WHERE
    EXISTS (
        SELECT 1
        FROM LATERAL FLATTEN(input => tags) AS tag
        WHERE tag.value:key LIKE 'addr%'
    )
LIMIT 100;