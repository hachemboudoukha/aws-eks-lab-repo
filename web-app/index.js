import http from 'http';
import fs from 'fs';

const PORT = 8000

const server = http.createServer((req, res) => {
  res.writeHead(200, { 'content-type': 'text/html' })
  fs.createReadStream('index.html').pipe(res)
})

console.log(`Server listening on port ${PORT}`);
server.listen(process.env.PORT || PORT)
