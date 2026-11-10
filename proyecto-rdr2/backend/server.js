const express = require('express');
const mysql = require('mysql2/promise');
const cors = require('cors');
const path = require('path');


const CONFIG_BD = {
  host: 'localhost',
  user: 'root',                 
  password: 'root',      
  database: 'RDR2'              
};

const PUERTO = 3000;

const app = express();
app.use(cors());
app.use(express.json());


app.use(express.static(path.join(__dirname, '../frontend')));

const pool = mysql.createPool({
  ...CONFIG_BD,
  waitForConnections: true,
  connectionLimit: 5
});


app.get('/api/objetos', async (req, res) => {
  try {
    const [filas] = await pool.query(`
      SELECT o.ID_Objeto AS id,
             o.Nombre_Objeto AS nombre,
             o.Stock AS stock,
             t.Nombre_Tienda AS tienda
      FROM Objeto o
      LEFT JOIN Tienda t ON t.ID_Objeto = o.ID_Objeto
      ORDER BY o.ID_Objeto
    `);
    res.json(filas);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});


app.get('/api/objetos/:id', async (req, res) => {
  try {
    const [filas] = await pool.query(
      'SELECT ID_Objeto AS id, Nombre_Objeto AS nombre, Stock AS stock FROM Objeto WHERE ID_Objeto = ?',
      [req.params.id]
    );
    if (filas.length === 0) {
      return res.status(404).json({ error: 'Objeto no encontrado' });
    }
    res.json(filas[0]);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.get('/api/tiendas', async (req, res) => {
  try {
    const [filas] = await pool.query(
      'SELECT ID_Tienda AS id, Nombre_Tienda AS nombre, ID_Objeto AS idObjeto FROM Tienda'
    );
    res.json(filas);
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.listen(PUERTO, () => console.log(`Servidor en http://localhost:${PUERTO}`));
