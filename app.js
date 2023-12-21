const express = require('express');
const mysql = require('mysql2');
const bodyParser = require('body-parser');
const portfinder = require('portfinder');

const app = express();
portfinder.getPort({ port: 3002 }, (err, port) => {
  if (err) {
    console.error('Virhe porttia etsiessä:', err);
    return;
  }

  const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'tietovisadb',
  });

  db.connect((err) => {
    if (err) {
      console.error('Tietokantayhteyden virhe: ' + err.stack);
      return;
    }
    console.log('Yhdistetty tietokantaan threadId: ' + db.threadId);
  });

  app.use(bodyParser.json());

  app.get('/', (req, res) => {
    res.sendFile(__dirname + '/index.html');
  });

  app.get('/kysymykset', (req, res) => {
    db.query('SELECT * FROM kysymykset', (err, results) => {
      if (err) throw err;
      res.json(results);
    });
  });

  app.post('/kysymykset', (req, res) => {
    const { kysymys, vastaus } = req.body;

    db.query('INSERT INTO kysymykset (kysymys, vastaus) VALUES (?, ?)', [kysymys, vastaus], (err, results) => {
      if (err) throw err;

      res.status(201).json({ message: 'Kysymys lisätty onnistuneesti.' });
    });
  });

  app.delete('/kysymykset/:id', (req, res) => {
    const kysymysId = req.params.id;

    db.query('DELETE FROM kysymykset WHERE id = ?', [kysymysId], (err, results) => {
      if (err) throw err;

      res.json({ message: 'Kysymys poistettu onnistuneesti.' });
    });
  });

  app.listen(port, () => {
    console.log(`Palvelin käynnistetty osoitteessa http://localhost:${port}`);
  });
});
