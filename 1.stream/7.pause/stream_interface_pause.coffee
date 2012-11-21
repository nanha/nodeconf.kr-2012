fs = require 'fs'
http = require 'http'

http.createServer (req, res)->
  dir = "#{__dirname}/data"

  ws = fs.createWriteStream "#{dir}/output.txt"
  req.pipe ws

  req.on 'end', ->
    res.end 'hello'

.listen 1337
