#
# 이번에 소개할 내용은 Duplex 스트림이고,
# A.pipe(B).pipe(C) 의 형태를 취합니다.
# 여러 장치는 입출력 stream 을 가지고 있고, 이들을 연결할 필요가 있습니다.
#
# duplex 구현방법은
# 1. 쓰기용스트림관련 메소드를 구현하고
# 각각의 함수안에서는
# 2. 읽기용스트림관련 이벤트를 선언하면 되는것입니다.
#
# 표준입력 읽기용 스트림을 대문자로 변경하는 Duplex 스트림으로 연결하고, 이를 다시 표준출력 쓰기용 스트림으로 연결해보겠습니다.
#
# 스트림 모듈을 불러오고
Stream = require 'stream'

# 객체를 선언하고,
dest = new Stream
# 2개의 멤버변수를 모두 true 으로 설정합니다.
dest.readable = dest.writable = true

# pipe의 중간입장에서 데이타를 전달하는
# Duplex 스트림을 구현합니다.
# 첫번째, 쓰기용 스트림의 메소드 구현합니다.
dest.write = (buf)->
  # 그리고, 대문자로 변경하여
  # 읽기용 스트림의 data 이벤트를 선언합니다.
  dest.emit 'data', buf.toString().toUpperCase()

# end 관련이벤트를 설정하고
dest.end =->
  dest.emit 'end'

# pipe 으로 연결한 후, 실행해보죠.
process.stdin
  .pipe(dest)
  .pipe(process.stdout)
