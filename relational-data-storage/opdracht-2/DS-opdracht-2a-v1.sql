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



