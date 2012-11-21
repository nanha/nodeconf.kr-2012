#
# 이번에는 Duplex 스트림을 하나더 연결하여
# A.pipe(B).pipe(C).pipe(D) 형태를 보여드리겠습니다.
#
# stream 모듈을 불러오고
Stream = require 'stream'

#
# 대문자로 변경하는 첫번째 duplex stream 입니다.
# 
# 객체를 생성하고
duplex1 = new Stream
# 멤버변수 2개를 true 으로 선언합니다.
duplex1.readable = duplex1.writable = true
# 쓰기용 write 메소드 구현
duplex1.write = (buf)->
  # 읽기용 data 이벤트 선언
  # 대문자로 변경하여 버퍼재설정하여 전달합니다.
  @emit 'data', new Buffer buf.toString().toUpperCase()
duplex1.end = ->
  console.log 'end!'

#
# 두번째 duplex  스트림입니다.
# 첫번째 duplex 스트림에서 전달된 버퍼에
# 또다른 버퍼를 붙입니다.
#
duplex2 = new Stream
duplex2.readable = duplex2.writable = true
duplex2.write = (buf)->
  # suffix 붙여서 Buffer.concat 붙이기
  @emit 'data', Buffer.concat [buf, new Buffer("--- @We.pipe(Node).pipe('본질').pipe(You)\n")]
duplex2.end = ->
  console.log 'end!'

#
# 파이프를 연결하고 실행해보겠습니다.
#
process.stdin
  .pipe(duplex1)
  .pipe(duplex2)
  .pipe(process.stdout)
