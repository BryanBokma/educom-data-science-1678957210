CREATE VIEW VERZENDLIJST AS 
SELECT 
    s.id AS ID,
    IF(s.p_address IS NOT NULL, CONCAT(s.straat, ' ', s.huisnr), s.p_address) AS adres,
    IF(s.p_postcode IS NOT NULL, s.postcode, s.p_postcode) AS postcode,
    IF(s.p_address <> NULL, c.name, ci.name) AS Stad
FROM mhl_suppliers AS s
LEFT JOIN mhl_cities AS c ON s.p_city_ID = c.id
LEFT JOIN mhl_cities AS ci ON s.city_ID = ci.id;