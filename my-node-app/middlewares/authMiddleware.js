//인증 및 권한 관련 미들웨어 정의
//특정 경로에 접근하기 전 인증이 필요한 경우 이 미들웨어 사용
module.exports = (req, res, next) => {
    if (!req.isAuthenticated()) {
        return res.status(403).send('Not authenticated');
    }
    next();
};
