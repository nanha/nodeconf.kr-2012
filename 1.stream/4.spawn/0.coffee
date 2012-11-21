#
# A.pipe(B) 파일다운로드 예제
# 디렉토리를 압축하는 프로세스를 띄우고
# 이것이 완료되면 파일을 read 파일스트림을 통해 읽고
# response 객체에 pipe 으로 연결한다.
#
http = require 'http'
fs = require 'fs'
spawn = require('child_process').spawn

http.createServer (req, res)->
  console.log req.url.yellow

  compress = spawn 'tar',  ['zcfv', 'a.tar.gz', 'data']
  compress.stdout.on 'data', (data)->
    console.log 'stdout'
  compress.stderr.on 'data', (data)->
    console.log 'stderr'
  compress.on 'exit', (errcode)->
    console.log arguments
    console.log 'exit'

    # download
    res.setHeader 'Content-type', 'application/octet-stream'
    res.setHeader 'Content-disposition', 'attachment; filename=a.tar.gz'
    src = fs.createReadStream 'a.tar.gz'
    src.pipe res
.listen 1337
