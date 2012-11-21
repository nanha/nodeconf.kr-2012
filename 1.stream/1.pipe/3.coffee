#
# 지금까지는 Node의 런타임에서 지원되는
# 스트림 기능을 살펴보았습니다.
# 지금부터는 stream interface 에 기초하여
# 쓰기용 스트림을 만들어보고
# 이것에 표준입력을 연결해보겠습니다.
#
# stream 모듈을 불러옵니다.
Stream = require 'stream'

# 스트림 객체를 생성하고
dest = new Stream

# pipe 메소드가 write 메소드를 실행하기 위한 조건인
# writable 멤버변수값을 true 으로 설정합니다.
dest.writable = true

# write 메소드를 구현합니다.
dest.write = (buf)->
  console.log "message received:", buf

# 그리고, end 메소드를 구현합니다.
dest.end =->
  console.log 'end'

# 이를 파이프로 연결해보고, 실행해보죠
process.stdin.pipe dest
