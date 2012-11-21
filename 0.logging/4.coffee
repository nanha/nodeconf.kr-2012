Logger  = require __dirname + '/Logger'

global.log  = new Logger __dirname + '/data/debug.log'
global.loge = new Logger __dirname + '/data/exception.log'

log.debug   'message'
log.info    'message'
log.notice  'message'
log.warning 'message'
log.error   'message'
log.alert   'message'
log.crit    'message'

##
d = require('domain').create()

d.on 'error', (err)->
  console.log 'from bind ! =========='
  console.error err
  console.error err.stack
  loge.crit err.stack

require('fs').readFile './nonExistFile', d.bind (err, data)->
  throw new Error err if err
  console.log arguments
