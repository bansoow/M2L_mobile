const router = require('express-promise-router')();

const { produit } = require('../controllers/produit');

router.route('/')
    .post(produit);

module.exports = router;