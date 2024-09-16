DELETE FROM fixed_beacons;
ALTER TABLE fixed_beacons AUTO_INCREMENT = 1;

INSERT INTO fixed_beacons (mac_address, device_name, floor, zone)
VALUES 
('60:98:66:33:42:D4', 'Beacon 1', '3', 'A_1'),
('60:98:66:32:8E:28', 'Beacon 2', '3', 'A_2'),
('60:98:66:32:BC:AC', 'Beacon 3', '3', 'A_3'),
('60:98:66:30:A9:6E', 'Beacon 4', '3', 'C_1'),
('60:98:66:32:CA:74', 'Beacon 5', '3', 'C_2'),
('60:98:66:2F:CF:9F', 'Beacon 6', '3', 'C_3'),
('60:98:66:32:B8:EF', 'Beacon 7', '3', 'E_3'),
('60:98:66:32:CA:59', 'Beacon 8', '3', 'E_2'),
('60:98:66:33:35:4C', 'Beacon 9', '3', 'E_1'),
('60:98:66:32:AF:B6', 'Beacon 10', '3', 'E_S_U'),
('60:98:66:33:0E:8C', 'Beacon 11',' 3', 'E_S_D'),
('60:98:66:32:C8:E9', 'Beacon 12', '3', 'D_S'),
('60:98:66:32:9F:67', 'Beacon 13', '3', 'B_S'), 
('60:98:66:33:24:44', 'Beacon 14', '3', 'A_S'),
('60:98:66:32:BB:CB', 'Beacon 15', '3', 'D_1'),
('60:98:66:32:AA:F8', 'Beacon 16', '3', 'D_2'),
('A0:6C:65:99:DB:7C', 'Beacon 17', '3', 'B_1'),
('60:98:66:32:98:58', 'Beacon 18', '3', 'B_2');
