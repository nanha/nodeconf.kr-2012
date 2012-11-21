#
# 자 우리는 읽기용과 쓰기용 스트림을 연결해봤죠.
# 그럼 이때 발생하는 이벤트의 순서가 어떻게 되는지 알아보죠
#
fs = require 'fs'

# 버퍼사이즈를 지정합니다.
bufferSize = 10

# 읽기용과 쓰기용 스트림을 선언하고
src   = fs.createReadStream  '../data/input.txt', bufferSize: bufferSize
dest  = fs.createWriteStream '../data/output.txt'

# 읽기용에 data, end, close 이벤트 설정합니다.
src
  .on 'data', (data)->
    console.log 'from src / data: '.yellow, data.toString()
    dest.write data
  .on 'end',   ()->
    console.log 'from src / end'
  .on 'close', ()->
    console.log 'from src / close'
  
# 그리고, 쓰기용에 drain 이벤트를 설정하고, 
# 나머지 이벤트는 뒤에서 설명하겠습니다.
dest
  .on 'drain', ()->
    console.log 'from dest / drain'.cyan

# 4가지의 이벤트가 어떻게 실행되는지 보죠
# <마지막 예제, 다음 pipe 이동>
