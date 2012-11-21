byline = require 'byline'
fs = require 'fs'

src = fs.createReadStream 'data/inputline.txt', bufferSize: 5
src.on 'data', (data)->
  console.log 'srcdata: ', data.toString()

line = byline.createStream()
line.on 'data', (data)->
  console.log 'linedata: ', data.toString()


src.pipe line
