#
# domain bind 함수입니다.
#
# 마찬가지로 domain 컨텍스트를 생성합니다.
d = require('domain').create()

# 에러 이벤트를 설정하고
d.on 'error', (err)->
  console.error 'domain from bind ! =========='
  console.error err
  console.error err.stack

# callback 을 bind 함수의 컨텍스트로 묶어버립니다.
require('fs').readFile './nonExistFile', d.bind (err, data)->
  throw new Error err if err
  console.log arguments

# 실행해보죠
