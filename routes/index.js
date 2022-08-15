var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Homepage' });
});

/* GET Login page. */
router.get('/0login', function(req, res, next) {
  res.render('0login', { title: 'Login' });
});

/* GET Rock Paper Scissors page. */
router.get('/1rps', function(req, res, next) {
  res.render('1rps', { title: 'R-P-S.' });
});

/* GET WALLET page. */
router.get('/2monster', function(req, res, next) {
  res.render('2monster', { title: 'Monster dApp' });
});

/* GET Carousel page. */
router.get('/3carousel', function(req, res, next) {
  res.render('3carousel', { title: 'Carousel' });
});

/* GET LorcanCoin page. */
router.get('/4lorcanCoin', function(req, res, next) {
  res.render('4lorcanCoin', { title: 'LorcanCoin' });
});

/* GET Contact page. */
router.get('/5contact', function(req, res, next) {
  res.render('5contact', { title: 'Contact Us' });
});


module.exports = router;
