#
# 이는 벡엔드서버로부터 chunk data 가 전달되는
# 이벤트르 설정하여 그 흐름을 알아볼 수 있습니다.
#
http = require 'http'
Request = require 'request'

# 벡엔드 리소스를 선언합니다.
backend_resource = 'http://web-002.filefarm.cafe24.com/121028/d64951df3183584ddb07/4547d98560fa8235a7079067617a43c8929.png'

http.createServer (req, res)->
  # Request 객체에 이를 전달하고
  proxy = Request backend_resource

  # 각종 이벤트를 선언합니다.
  proxy.on 'data', (data)->
    console.log Buffer.isBuffer(data), data.length
  proxy.on 'end', ->
    console.log 'end'

  # pipe 를 사용하여 이를 연결합니다.
  req.pipe(proxy).pipe res
.listen 1337
