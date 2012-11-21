byline = require 'byline'
fs = require 'fs'

src = fs.createReadStream 'data/inputline.txt'
dest = fs.createWriteStream 'data/outputline.txt'

# 이부분 스위칭
src = byline.createStream src

src.on 'data', (data)->
  console.log data.toString()

src.pipe dest
