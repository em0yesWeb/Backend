require('dotenv').config();
const express = require('express');
const bodyParser = require('body-parser');
const beaconRoutes = require('./routes/index.js');

const app = express();
const port = process.env.PORT || 8080;

app.use(bodyParser.json());
app.use('/api', beaconRoutes);

app.get('/', (req, res) => {
    res.send('BeaconMap 애플리케이션이 실행 중입니다.');
});

app.listen(port, () => {
    console.log(`서버가 http://localhost:${port} 에서 실행 중입니다.`);
});
