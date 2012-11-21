#
# 파일복사하는 예제입니다. 참고로 Node 런타임에서는
# 파일복사 메소드가 없습니다.
# 두가지의 파일스트림 메세도를 연결하고
# 그냥 복사하면 심심하니까
# 소문자를 대문자로 변경하여 저장해보겠습니다.
#
fs = require 'fs'

# 두가지의 파일스트림을 선언하고
src  = fs.createReadStream  '../data/input.txt'
dest = fs.createWriteStream '../data/output.txt'

# data 이벤트를 설정합니다.
# 참고로 pipe 으로 연결할시에는
# pipe 선언보다 상위에 이벤트를 설정해야합니다.
src.on 'data', (buf)->
  # 버퍼객체가 전달되면 
  # 대문자로 변경 후 버퍼의 write 메소드를 사용
  # 전달되는 buffer 재작성
  buf.write buf.toString().toUpperCase()

# 파이프로 연결합니다.
src.pipe dest

# 그럼 실행해보죠
