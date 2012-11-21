# ab -n 10000 -c 200 http://nodeqa.com:1337/ | grep -E 'Time taken|per|Length'
SIZE = 64*1024
http = require 'http'
buffer = new Buffer SIZE
buffer[i] = 100 for i in [0..buffer.length]

http.createServer (req, res)->
  res.end buffer
.listen 1338, ->
  console.log process.pid
