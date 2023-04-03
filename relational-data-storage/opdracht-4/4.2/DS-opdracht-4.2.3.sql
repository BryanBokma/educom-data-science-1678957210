SELECT IFNULL(r.id, sr.id) AS ID, IFNULL(r.name, sr.name) AS hoofdrubriek, IF(ISNULL(r.name), " ", sr.name) AS subrubriek
FROM mhl_rubrieken AS r
RIGHT OUTER JOIN mhl_rubrieken AS sr ON sr.parent = r.id
ORDER BY hoofdrubriek, subrubriek;
