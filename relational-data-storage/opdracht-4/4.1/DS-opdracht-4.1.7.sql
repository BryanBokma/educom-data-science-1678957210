SELECT c.name, ci.name, c.id, ci.id, c.commune_ID, ci.commune_ID
FROM mhl_cities AS c
JOIN mhl_cities AS ci ON c.name = ci.name
WHERE c.id < ci.id
ORDER BY c.name;
