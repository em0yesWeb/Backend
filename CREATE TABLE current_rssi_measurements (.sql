CREATE TABLE current_rssi_measurements (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    scanner_id INT NOT NULL,
    fixed_beacon_id INT NOT NULL,
    rssi INT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (scanner_id) REFERENCES beacon_scanners(id),
    FOREIGN KEY (fixed_beacon_id) REFERENCES fixed_beacons(id)
);