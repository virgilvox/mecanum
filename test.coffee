Mecanum = require './index.coffee'
mec = new Mecanum({
    cw: 60
    ccw: 40
    stop: 51
  })

# Call it like this

console.log mec.move 'forward'
console.log mec.move 'backward'
console.log mec.move 'left'
console.log mec.move 'right'
console.log mec.move 'ne'
console.log mec.move 'nw'
console.log mec.move 'se'
console.log mec.move 'sw'
console.log mec.move 'cw'
console.log mec.move 'ccw'
console.log mec.move 'stop'

## Or like this

mec.move 'forward', (data) ->
  console.log data
