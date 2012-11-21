#
# Node 의 대부분의 API 는 stream 객체를 상속하여 제공됩니다.
# 이번에는 Stream 객체를 상속하여 작성한 Duplex 모듈로
# 파일스트림을 연결해보겠습니다.
#
# fs와 제작한 duplex 모듈을 불러옵니다.
fs = require 'fs'
Duplex = require './duplex'

# 버퍼사이즈를 설정하고
bufferSize = 10

# duplex 객체와 2개의 파일스트림을 선언합니다.
duplex = new Duplex()
src  = fs.createReadStream   '../data/input.txt',
  bufferSize: bufferSize
dest = fs.createWriteStream  '../data/output.txt'

# 각종 이벤트를 모두 설정하고
src
  .on 'data', (data)->
    console.log 'from src / data'.yellow, data.toString()
  .on 'end',   ()->
    console.log '========================='
    console.log 'from src / end'.yellow
  .on 'error', (e)->
    console.log 'from src / error'.yellow
  .on 'close', ()->
    console.log 'from src / colse'.yellow

dest
  .on 'drain', ()->
    console.log 'from dest / drain'.cyan
  .on 'error', (e)->
    console.log 'from dest / error'.cyan
  .on 'close', ()->
    console.log 'from dest / close'.cyan
  .on 'pipe',  (src)->
    console.log 'from dest / pipe'.magenta

# duplex 스트림을 연결하여 실행해보겠습니다.
src.pipe(duplex).pipe(dest)
