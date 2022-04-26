const pool = require('../config/database');

module.exports = {
    ajoutProduit: async (req, res, next) => {
        let connexion;
        try {
            connexion = await pool.getConnection();
            const result = await connexion.query(ajoutProduit());
            return res.status(200).json(result)
        } catch (error) {
            return res.status(400).json({ error: error.message });
        } finally {
            if (connexion) connexion.end()
        }
    }
}