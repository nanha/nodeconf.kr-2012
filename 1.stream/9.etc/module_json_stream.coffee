request = require 'request'
jst = require 'JSONStream'
es = require 'event-stream'

parser = jst.parse ['author', true]
req = request url: 'http://registry.npmjs.org/-/all'
parser.on 'data', (buf)->
  console.log buf
logger = es.mapSync (data)->
  console.log data
  return data

req.pipe(parser)
parser.pipe(logger)
