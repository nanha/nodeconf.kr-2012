#
# 앞서 스트림사이의 이벤트의 순서를 알아보았습니다.
# pipe 으로 연결할시에는 앞서 그림에서 설명한 8가지의
# 이벤트 조절이 일어납니다. 그 흐름을 알아보겠습니다.
#
fs = require 'fs'

bufferSize = 10

# 스트림 2가지를 설정합니다.
src  = fs.createReadStream  '../data/input.txt',
  bufferSize: bufferSize
dest = fs.createWriteStream '../data/output.txt'

# 읽기용 스트림에 인터페이스에서 지원되는
# 4가지 이벤트를 설정합니다.
src
  .on 'data', (data)->
    console.log 'from src / data'.yellow, data.toString()
  .on 'end', ->
    console.log '====================='
    console.log 'from src / end'.yellow
  .on 'error', (e)->
    console.log 'from src / error'.yellow
  .on 'close', ->
    console.log 'from src / close'.yellow
  
# 쓰기용에도 4가지 모두 설정합니다.
dest
  .on 'drain', ->
    console.log 'from dest / drain'.cyan
  .on 'error', (e)->
    console.log 'from dest / error'.cyan
  .on 'close', ->
    console.log 'from dest / close'.cyan
  # <최소 실행되며, 모든 이벤트를 알아서 설정하고
  # 실행합니다.>
  .on 'pipe',  (src)->
    console.log 'from dest / pipe'.magenta

# 파이프로 연결합니다.
src.pipe dest

# 실행해보죠
