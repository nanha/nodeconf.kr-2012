#
# Stream 객체를 상속하여 제작한 Duplex 모듈입니다.
# 흐름만 간단히 보시죠
#
# A.pipe(duplex).pipe(C)
# writeStream 입장에서 readable 을 위해서 event 발생시킴
#
# stream 은 new Stream 하여 메소드를 구현할 수 있다.
# 또한, 아래와 같이 "상속"을 하여 메소드를 구현할 수 있다.
#

util = require 'util'
# 스트림 모듈을 불러오고
Stream = require 'stream'

Duplex = ->
  # 2개의 멤버변수로 설정하며,
  @writable = true
  @readable = true

# 스트림객체를 상속합니다.
# 이때 자동으로 pipe 메소드가 장착되죠
util.inherits Duplex, Stream

# 쓰기용 스트림의 메소드를 구현하고,
# 각각의 함수안에서는
# 입력용 스트림의 이벤트를 선언하면 됩니다.
Duplex.prototype.write = (data)->
  @emit 'data', data
Duplex.prototype.end = ->
  @emit 'end'
Duplex.prototype.destroy = ->
  @emit 'close'

module.exports = Duplex
