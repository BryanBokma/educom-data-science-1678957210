SELECT c.name, IFNULL(com.name, "invalid") AS commune_name
from mhl_cities AS c
JOIN mhl_communes AS com ON c.commune_ID = com.id;