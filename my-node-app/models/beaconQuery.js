//데이터베이스 쿼리문 -> 데이터 CRUD 작업 수행
const connection = require('../config/db');

const Beacon = {};

Beacon.getAll = (callback) => {
    const query = 'SELECT * FROM fixed_beacons';
    connection.query(query, callback);
};

Beacon.insert = (data, callback) => {
    const query = 'INSERT INTO current_rssi_measurements SET ?';
    connection.query(query, data, callback);
};

module.exports = Beacon;
