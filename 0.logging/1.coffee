# 
# exception 를 잡기위한 domain 모듈에 대해서 알아봅니다.
# 2가지만 기억하세요. run 메소드와 bind 메소드입니다.
# 가장 기본적인 방법인 run 메소드부터 설명합니다.
#
# domain 모듈을 로드한후 create 메소드를 실행하여
# domain 컨텍스트를 준비합니다.
d = require('domain').create()

# 에러이벤트를 설정합니다.
d.on 'error', (err)->
  console.error 'domain from run ! =========='
  console.error err
  console.error err.stack

#
# domain의 run 메소드로 감싼 함수안에서
# 프로그램을 구현합니다.
d.run ->
  # 존재하지 않은 파일을 읽어들여
  # throw 에러를 발생시켜보겠습니다.
  require('fs').readFile './nonExistFile', (err, data)->
    throw new Error err if err
    console.log arguments

# 자 실행해보죠
