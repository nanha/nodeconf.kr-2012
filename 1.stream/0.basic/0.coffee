#
# 파일스트림의 기본구성에 대해서 알아보겠습니다.
# 첫번째 읽기용 스트림입니다.
#
# 파일시스템 모듈을 불러오고
fs = require 'fs'

# 타켓을 설정합니다.
target = '../data/input.txt'

# createReadStream에 타켓을 지정하고
# 옵션중 bufferSize를 5으로 설정하여
# data의 흐름을 알아볼 수 있도록 합니다.
src = fs.createReadStream target, bufferSize: 5

# EventEmitter 객체를 상속하고 있기 때문에
# 아래와 같이 이벤트를 설정할 수 있습니다.
# 읽기용 스트림에서 지원하는 이벤트중 data와 end
# 이벤트를 설정합니다.
src.on 'data', (buf)->
  console.log 'from src / data: '.yellow, buf.toString()
src.on 'end', ->
  console.log 'from src / end'

# 그럼 실행해보죠
