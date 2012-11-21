#
# pipe 사용하지 않고 피보나치의 결과를 매순간
# write 파일스트림에 작성하는 예제
# child process stdout 또한 stream 의 인스턴스이다.
#
spawn = require('child_process').spawn
fs = require 'fs'

dest = fs.createWriteStream '../data/childprocess_stdout.txt'

src = spawn 'python',  ['fibo.py', '30']

src.stdout.on 'data', (data)->
  console.log 'stdout'
  console.log data
  dest.write data.toString()

src.stderr.on 'data', (data)->
  console.error 'stderr'
  console.error data.toString()

src.on 'exit', (errcode)->
  console.log 'exit'
  console.log arguments
