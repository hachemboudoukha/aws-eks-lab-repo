import http from 'http';
import fs from 'fs';

const PORT = 8000;
let cachedHTML = null;

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'Content-Type': 'text/html' });
  if (cachedHTML) {
    res.end(cachedHTML);
  } else {
    fs.readFile('index.html', 'utf-8', (err, data) => {
      if (err) {
        res.statusCode = 500;
        res.end('Error loading page');
        return;
      }
      cachedHTML = data;
      res.end(data);
    });
  }
});

console.log(`Server listening on port ${PORT}`);
server.listen(process.env.PORT || PORT);
