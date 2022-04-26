const router = require('express-promise-router')();

const { ajoutProduit } = require('../controllers/ajoutProduit');

router.route('/')
    .post(ajoutProduit);

module.exports = router;