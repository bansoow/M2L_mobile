const router = require('express-promise-router')();

const { supprimerProduit } = require('../controllers/produit');

router.route('/produit/supprimerProduit/:id')
    .get(supprimerProduit);

module.exports = router;