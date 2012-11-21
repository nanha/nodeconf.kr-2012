#
# 두번째로 쓰기용 스트림입니다.
#
# 모듈을 불러오고
fs = require 'fs'

# 타겟을 설정하고
target = '../data/output'

# createWriteStream에 타켓을 지정합니다.
dest = fs.createWriteStream target

# 버퍼사이즈를 임의로 설정하고,
buf = new Buffer 100
msg = "1st Korea Node.js Conference\n"
# 버퍼에 메세지를 작성합니다.
buf.write msg, 0

# 쓰기용스트림에 write 메소드를 사용하여 버퍼를 작성합니다.
dest.write buf
dest.end()

# 그럼 실행해보죠
