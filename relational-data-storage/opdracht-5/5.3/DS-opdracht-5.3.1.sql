CREATE VIEW DIRECTIE AS
SELECT 
	c.supplier_ID AS ID, 
    c.name AS contact,
    c.contacttype AS functie,
    d.name AS department
FROM mhl_contacts AS c
INNER JOIN mhl_departments AS d ON c.department = d.id
WHERE c.department='Directie' OR c.contacttype LIKE '%directeur%';