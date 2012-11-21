#
# 이것은 웹서버에서 반환되는 데이타를 압축하는 예제입니다.
# 
# oppressor module 사용하면
# A.pipe(B).pipe(C) 의 형태를 학습할 수 있게 됩니다.
# 흐름만 보시죠
#
fs = require 'fs'
http = require 'http'
oppressor = require 'oppressor'

http.createServer (req, res)->
  # 이부분에서
  # 읽기용 파일스트림를
  # 스트림객체를 상속하여 제작한 oppressor 모듈에 연결
  # 마찬가지로 스트림객체를 상속하여
  # 제작된 http response 객체에 전달합니다.
  fs.createReadStream(__dirname + '/data/npm_all.json')
    .pipe(oppressor(req))
    .pipe(res)
.listen 1337
