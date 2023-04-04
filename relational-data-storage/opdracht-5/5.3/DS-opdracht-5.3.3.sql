CREATE VIEW query AS 
SELECT 
    s.name AS name,
    d.contact AS contact,
    v.adres AS adres,
    v.postcode AS postcode, 
    v.stad AS stad
FROM mhl_suppliers AS s
JOIN verzendlijst AS v ON v.ID = s.id
LEFT JOIN directie AS d ON d.ID = s.id;
-- waardes van contact komen terug met null, dus t.a.v. directie toevoegen

CREATE VIEW query AS 
SELECT 
    s.name AS name,
    IFNULL(d.contact, '  t.a.v. directie  ') AS contact,
    v.adres AS adres,
    v.postcode AS postcode, 
    v.stad AS stad
FROM mhl_suppliers AS s
JOIN verzendlijst AS v ON v.ID = s.id
LEFT JOIN directie AS d ON d.ID = s.id;
-- nu met t.a.v. directie op de NULL waarden