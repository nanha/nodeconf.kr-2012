#
# show browser
# view stream
# - allocate small buffer
# - read and return small buffer
# - repeat
#
http = require 'http'
fs = require 'fs'

http.createServer (req, res)->
  read = fs.createReadStream 'data/100M.dd'
  read.on 'data', (data)->
    console.log new Date, data.length
  read.pipe res
.listen 1337, ->
  console.log process.pid
