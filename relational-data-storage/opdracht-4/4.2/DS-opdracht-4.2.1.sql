SELECT c.name, c.commune_ID
FROM mhl_cities AS c
LEFT JOIN mhl_communes AS com ON c.commune_ID = com.id
WHERE com.id IS NULL;