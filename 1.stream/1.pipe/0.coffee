#
# 자 스트림의 pipe 에 대해서 설명합니다.
# A.pipe(B) 의 형태에 해당하고
# 표준입력 읽기용 스트림을 쓰기용 스트림으로 연결합니다.
#
# 앞선 예제에서는 여러줄로 구성되었는데,
# 스트림의 프로토타입 메소드인 pipe 를 사용하니
# 한줄로 정리되었습니다.
#
fs = require 'fs'

# 타겟을 선언하고
target = '../data/output.txt'

# 파이프로 연결합니다.
process.stdin.pipe fs.createWriteStream target

# 실행해보죠
