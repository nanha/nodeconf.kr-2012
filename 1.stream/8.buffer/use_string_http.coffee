# ab -n 10000 -c 200 http://nodeqa.com:1337/ | grep -E 'Time taken|per|Length'
SIZE = 64*1024
http = require 'http'
string = ""
string += 'd' for i in [0..SIZE]

http.createServer (req, res)->
  res.end string
.listen 1337, ->
  console.log process.pid
