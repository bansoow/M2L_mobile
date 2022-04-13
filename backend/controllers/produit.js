const pool = require('../config/database');

module.exports = {
    produit: async (req, res, next) => {
        let connexion;
        try {
            connexion = await pool.getConnection();
            const result = await connexion.query('SELECT * FROM t_produit WHERE id_produit = 1;');
            return res.status(200).json(result)
        } catch (error) {
            return res.status(400).json({ error: error.message });
        } finally {
            if (connexion) connexion.end()
        }
    }
}