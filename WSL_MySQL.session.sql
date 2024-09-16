CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);


CREATE TABLE fixed_beacons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mac_address VARCHAR(255) NOT NULL UNIQUE,
    device_name VARCHAR(255) NOT NULL,
    floor INT NOT NULL,
    zone VARCHAR(255) NOT NULL
);

CREATE TABLE beacon_scanners (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mac_address VARCHAR(255) NOT NULL UNIQUE,
    device_name VARCHAR(255) NOT NULL
);

CREATE TABLE current_rssi_measurements (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    scanner_id INT NOT NULL,
    fixed_beacon_id INT NOT NULL,
    rssi INT NOT NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (scanner_id) REFERENCES beacon_scanners(id),
    FOREIGN KEY (fixed_beacon_id) REFERENCES fixed_beacons(id)
);

CREATE TABLE estimated_locations (
    scanner_id INT NOT NULL,
    floor INT NOT NULL,
    zone VARCHAR(255),
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (scanner_id) REFERENCES beacon_scanners(id)
);

CREATE TABLE rssi_measurements_YYYY_MM  (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    scanner_id INT NOT NULL,
    fixed_beacon_id INT NOT NULL,
    rssi INT not NULL,
    timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (scanner_id) REFERENCES beacon_scanners(id),
    FOREIGN KEY (fixed_beacon_id) REFERENCES fixed_beacons(id)
);
