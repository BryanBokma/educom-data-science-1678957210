-- Drop foreign key constraints

-- mhl_districts
ALTER TABLE mhl_districts
DROP FOREIGN KEY FK_country_ID;

-- mhl_communes
ALTER TABLE mhl_communes
DROP FOREIGN KEY FK_district_ID;

-- mhl_cities
ALTER TABLE mhl_cities
DROP FOREIGN KEY FK_communes_ID;

-- mhl_detaildefs
ALTER TABLE mhl_detaildefs
DROP FOREIGN KEY FK_group_ID;

ALTER TABLE mhl_detaildefs
DROP FOREIGN KEY FK_propertytype_ID;

-- mhl_properties
ALTER TABLE mhl_properties
DROP FOREIGN KEY FK_supplier_ID;

ALTER TABLE mhl_properties
DROP FOREIGN KEY FK_propertytype_ID;

-- mhl_yn_properties
ALTER TABLE mhl_yn_properties
DROP FOREIGN KEY FK_supplier_ID;

ALTER TABLE mhl_yn_properties
DROP FOREIGN KEY FK_propertytype_ID;

-- mhl_suppliers_mhl_rubriek_view
ALTER TABLE mhl_suppliers_mhl_rubriek_view
DROP FOREIGN KEY FK_suppliers_ID;

ALTER TABLE mhl_suppliers_mhl_rubriek_view
DROP FOREIGN KEY FK_rubriek_view_ID;

-- mhl_contacts
ALTER TABLE mhl_contacts
DROP FOREIGN KEY FK_supplier_ID;

ALTER TABLE mhl_contacts
DROP FOREIGN KEY FK_department;

-- mhl_hitcount
ALTER TABLE mhl_hitcount
DROP FOREIGN KEY FK_suppliers_ID;

-- mhl_suppliers
ALTER TABLE mhl_suppliers
DROP FOREIGN KEY FK_membertype;

ALTER TABLE mhl_suppliers
DROP FOREIGN KEY FK_company;

ALTER TABLE mhl_suppliers
DROP FOREIGN KEY FK_postcode;

ALTER TABLE mhl_suppliers
DROP FOREIGN KEY FK_city_ID;

---------------------------------------------------------------------------------------------------

-- Create foreign keys 

-- mhl_districts (succes)
ALTER TABLE mhl_districts
ADD FOREIGN KEY (country_ID) REFERENCES mhl_countries(id);

-- mhl_communes (succes)
ALTER TABLE mhl_communes
ADD FOREIGN KEY (district_ID) REFERENCES mhl_districts(id);

-- mhl_cities (Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`mhl`.`#sql-53cc_cb`, CONSTRAINT `#sql-53cc_cb_ibfk_1` FOREIGN KEY (`commune_ID`) REFERENCES `mhl_communes` (`id`)))
ALTER TABLE mhl_cities
ADD FOREIGN KEY (commune_ID) REFERENCES mhl_communes(id);

    -- Kijken waar de fout zit
    SELECT * 
    FROM mhl_cities
    LEFT JOIN mhl_communes ON
    mhl_cities.commune_ID = mhl_communes.id
    WHERE mhl_communes.id IS NULL;

    ALTER TABLE mhl_cities MODIFY commune_ID INT(11) NULL;

    -- commune_ID de waarde NULL geven
    UPDATE mhl_cities
    SET commune_ID=NULL
    WHERE commune_ID=0;

    -- Bij de output is te zien bij de eerste query dat de waardes 0 aanwezig zijn en 755 geen bekende commune_ID is
     DELETE FROM mhl_cities WHERE commune_ID = 755;
    -- succes

-- mhl_contacts 

-- supplier_ID FK
ALTER TABLE mhl_contacts
ADD FOREIGN KEY (supplier_ID) REFERENCES mhl_suppliers(id);

    -- kijken waar de fout zit
    SELECT * 
    FROM mhl_contacts
    LEFT JOIN mhl_suppliers ON
    mhl_contacts.supplier_ID = mhl_suppliers.id
    WHERE mhl_suppliers.id IS NULL;

    ALTER TABLE mhl_contacts MODIFY supplier_ID INT(11) NULL;

    UPDATE mhl_contacts
	SET supplier_ID = NULL
	WHERE supplier_ID IN(
		SELECT supplier_ID FROM mhl_contacts
		LEFT JOIN mhl_suppliers ON mhl_contacts.supplier_ID = mhl_suppliers.id
		WHERE mhl_suppliers.id IS NULL);
    -- succes

-- department FK
ALTER TABLE mhl_contacts
ADD FOREIGN KEY (department) REFERENCES mhl_departments(id);
    -- succes

-- mhl_hitcount (error 1452)
ALTER TABLE mhl_hitcount
ADD FOREIGN KEY (supplier_ID) REFERENCES mhl_suppliers(id);

    -- kijken waar de fout zit
    SELECT * 
    FROM mhl_hitcount
    LEFT JOIN mhl_suppliers ON
    mhl_hitcount.supplier_ID = mhl_suppliers.id
    WHERE mhl_suppliers.id IS NULL;

    ALTER TABLE mhl_hitcount MODIFY supplier_ID INT(11) NULL;

    UPDATE mhl_hitcount
    SET supplier_ID = NULL
    WHERE supplier_ID IN(
        SELECT supplier_ID FROM mhl_hitcount
        LEFT JOIN mhl_suppliers ON mhl_hitcount.supplier_ID = mhl_suppliers.id
        WHERE mhl_suppliers.id IS NULL);
    -- werkt nog steeds niet
    
-- mhl_suppliers_mhl_rubriek_view
-- error
ALTER TABLE mhl_suppliers_mhl_rubriek_view
ADD FOREIGN KEY (mhl_suppliers_ID) REFERENCES mhl_suppliers(id);

-- error
ALTER TABLE mhl_suppliers_mhl_rubriek_view
ADD FOREIGN KEY (mhl_rubriek_view_ID) REFERENCES mhl_rubrieken(id);

-- mhl_detaildefs
ALTER TABLE mhl_detaildefs
ADD FOREIGN KEY (group_ID) REFERENCES mhl_detailgroups(id);
-- succes

-- error
ALTER TABLE mhl_detaildefs
ADD FOREIGN KEY (propertytype_ID) REFERENCES mhl_propertytypes(id);

-- mhl_properties
-- error
ALTER TABLE mhl_properties
ADD FOREIGN KEY (supplier_ID) REFERENCES mhl_suppliers(id);

-- kijken waar de fout zit
SELECT * FROM mhl_properties
LEFT JOIN mhl_suppliers ON supplier_ID = id
WHERE id IS NULL;

    ALTER TABLE mhl_suppliers MODIFY id INT(11) NULL;
    UPDATE mhl_suppliers
    SET id=NULL
    WHERE id=0;
    -- werkt nog steeds niet

-- error
ALTER TABLE mhl_properties
ADD CONSTRAINT FK_mhl_properties_propertytype_ID
FOREIGN KEY (propertytype_ID) REFERENCES mhl_propertytypes(id);

SELECT * FROM mhl_properties P
LEFT JOIN mhl_propertytypes PT ON P.propertytype_ID = PT.id
WHERE PT.id IS NULL;
-- Hier staan allemaal propertytype_ID = 0 in de mhl_properties tabel. Je kan dit dan veranderen door NULLs.

    ALTER TABLE mhl_properties MODIFY propertytype_ID INT(11) NULL;
	UPDATE mhl_properties
	SET propertytype_ID=NULL
	WHERE propertytype_ID=0;
-- succes

-- mhl_yn_properties
-- error
ALTER TABLE mhl_yn_properties
ADD FOREIGN KEY (supplier_ID) REFERENCES mhl_suppliers(id);

-- error
ALTER TABLE mhl_yn_properties
ADD FOREIGN KEY (propertytype_ID) REFERENCES mhl_propertytypes(id);

-- mhl_suppliers

-- membertypes 
ALTER TABLE mhl_suppliers
ADD FOREIGN KEY (membertype) REFERENCES mhl_membertypes(id);

    -- waardes membertypes sommige zijn 0
    SELECT * FROM mhl_suppliers
    LEFT JOIN mhl_membertypes ON mhl_suppliers.membertype = mhl_membertypes.id
    WHERE mhl_membertypes.id IS NULL;

    -- de waardes 0 veranderen naar NULL
    UPDATE mhl_suppliers
    SET membertype=NULL
    WHERE membertype=0;
-- succes




