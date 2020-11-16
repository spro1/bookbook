const express = require('express');
const router = express.Router();

const mysql_dbc = require('../model/db')();
const connection = mysql_dbc.init();
mysql_dbc.test_open(connection);


router.get('/', function(req, res, next){
  res.status(500).send('Internal Server Error');
})

/* version */
router.get('/version', function(req, res, next) {
  res.json({"version" : "1.0"});
});

/* user manage */
/*
    회원 정보 업데이트
    회원 가입
    회원 탈퇴
 */
router.get('/user', function(req,res,next){

});

/* write reading book */
/*
    독서록 입력
    독서록 편집
    독서록 정보
    독서록 삭제
    좋아요 카운팅(중복 체크)
 */





module.exports = router;
