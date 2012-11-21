#
# A.pipe(B).pipe(C) Proxy 예제입니다.
# Request 모듈은 대표적인 NetworkStream 모듈입니다.
#
http = require 'http'
# request 모듈을 불러옵니다.
Request = require 'request'

http.createServer (req, res)->
  # Request 객체에 backend host와 전달된 url 을 선언합니다.
  proxy = Request 'http://nodeqa.com' + req.url

  # A.pipe(B).pipe(C) 의 형태로
  # 파이프를 사용하여 이를 연결합니다.
  req.pipe(proxy).pipe res
.listen 1337
