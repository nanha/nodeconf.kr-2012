#
# child process stdout 또한 stream 의 인스턴스이다.
# pipe 를 사용하여 피보나치 결과를 write stream 으로 작성하고
# child process stdout 의 read stream 이벤트를 모니터링하며
# write stream 이벤트 또한 모니터링하도록 이벤트를 설정한다.
#
spawn = require('child_process').spawn
fs = require 'fs'

dest = fs.createWriteStream '../data/childprocess_stdout.txt'

P = spawn 'python',  ['fibo.py', 20]

# ------------------------------------------------------
src = P.stdout
src
  .on 'data', (data)->
    console.log 'from src / data'.yellow, data
  .on 'end', ->
    console.log '=================================='
    console.log 'from src / end'.yellow
  .on 'error', (e)->
    console.log 'from src / error'.yellow
  .on 'close', ->
    console.log 'from src / colse'.yellow
  
dest
  .on 'drain', ->
    console.log 'from write / drain -----------'.cyan
  .on 'error', (e)->
    console.log 'from write / error'.cyan
  .on 'close', ->
    console.log 'from write / close'.cyan
  .on 'pipe',  (src)->
    console.log 'from write / pipe'.cyan
# ------------------------------------------------------

src.pipe dest

P.stderr.on 'data', (data)->
  console.error 'stderr'
  console.error data.toString()
P.on 'exit', (errcode)->
  console.log '========================================='
  console.log 'exit'.red
  console.log arguments
