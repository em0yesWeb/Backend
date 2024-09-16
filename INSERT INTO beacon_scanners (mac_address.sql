-- INSERT INTO beacon_scanners (mac_address, device_name)
-- VALUES ('7d785333a66f0d48', 'S21');

UPDATE beacon_scanners 
SET device_name = 'S23'
WHERE id = 1;