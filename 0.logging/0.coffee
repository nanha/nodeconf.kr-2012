#
# 로그를 남기는 방법은
# console과 process 객체를 사용합니다.
# 서버프로그램의 가장 기본은
# 표준출력과 표준에러를 구분하여 사용하셔야 합니다.
#
# console 은 v8 이 지원하고 있는것이 아닌
# node의 라이브러리 디렉토리에 console.js 라고 존재하며
# 이는 process 객체를 wrapping 하고 있습니다.
#
# 4가지의 로그내용입니다.

console.log   'stdout from console'
console.error 'stderr from console'

process.stdout.write "stdout from process\n"
process.stderr.write "stderr from process\n"

# 실행해보죠
