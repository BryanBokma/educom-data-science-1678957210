SELECT c.name AS name, c.id AS cid1, ci.id AS cid2, co.id AS gid1, com.id AS gid2, co.name AS gemeente_1, com.name AS gemeente_2
FROM mhl_cities AS c
JOIN mhl_cities AS ci ON c.name = ci.name
JOIN mhl_communes AS co ON c.commune_ID = co.id
JOIN mhl_communes AS com ON ci.commune_ID = com.id
WHERE c.id < ci.id
ORDER BY c.name;