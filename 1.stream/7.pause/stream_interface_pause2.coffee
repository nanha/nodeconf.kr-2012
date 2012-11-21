# echo 'wow' | curl -sT- localhost:1337
fs = require 'fs'
http = require 'http'

http.createServer (req, res)->
  id = Math.random().toString(16).slice 2
  dir = "#{__dirname}/data/#{id}"

  # puase
  req.pause()

  fs.mkdir dir, (err)->
    # resume
    req.resume()
    ws = fs.createWriteStream "#{dir}/output.txt"
    req.pipe ws

    req.on 'end', ->
      res.end new Buffer "#{id}\n"

.listen 1337
