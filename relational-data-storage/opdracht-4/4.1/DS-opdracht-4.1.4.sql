select s.name, s.straat, s.huisnr, s.postcode
FROM mhl_yn_properties AS ynp
INNER JOIN mhl_suppliers AS s ON ynp.supplier_ID = s.id
LEFT JOIN mhl_propertytypes AS pt ON ynp.propertytype_ID = pt.id
WHERE pt.name='specialistische leverancier' OR pt.name='ook voor particulieren';

-- geeft niet de gewenste output, waarom niet?
select s.name, straat, huisnr, postcode, p.name
FROM mhl_suppliers AS s
INNER JOIN mhl_properties AS p ON s.id = p.supplier_ID
LEFT JOIN mhl_propertytypes AS pt ON p.propertytype_ID = pt.id
WHERE (pt.name='specialistische leverancier') OR pt.name='ook voor particulieren';