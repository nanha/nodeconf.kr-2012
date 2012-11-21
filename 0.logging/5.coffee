http = require 'http'
d = require('domain').create()

Logger = require './Logger'
global.log  = new Logger __dirname + '/data/debug.log'
global.loge = new Logger __dirname + '/data/exception.log'

http.createServer d.bind (req, res)->
  log.info req.url
  if req.url == '/favicon.ico' then return

  d.on 'error', (err)->
    console.error 'domain==='
    loge.crit err.stack
    res.end err.stack

  # error
  JSON.parse '{}.'

  res.end 'wow'
.listen 1337
