DELETE FROM current_rssi_measurements;

ALTER TABLE current_rssi_measurements 
ADD UNIQUE KEY unique_measurement (scanner_id, fixed_beacon_id);
