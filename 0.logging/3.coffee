#
# 표준출력과 표준에러를 구분하여
# 웹서버에 구현하고 이를 실행하여 로그를 확인해보겠습니다
#
# c 3 2>./data/stderr 1>./data/stdout
# forever start -c c -e ./data/stderr -o ./data/stdout 3.coffee

# 웹서버를 실행합니다.
require('http').createServer (req, res)->
  # 표준출력과 표준에러를 남깁니다.
  console.log   'stdout from httpserver'
  console.error 'stderr from httpserver'
  res.end '1st Node.js Korea Conference'
.listen 1337

# 실행해보죠
