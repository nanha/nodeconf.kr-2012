#
# show browser
# 많은 리소스 점유 218m
# top -c
# - allocate 100 Mb buffer
# - read and return 100 Mb buffer
#
http = require 'http'
fs = require 'fs'

http.createServer (req, res)->
  fs.readFile 'data/100M.dd', (err, result)->
    res.end new Buffer result
.listen 1338, ->
  console.log process.pid
