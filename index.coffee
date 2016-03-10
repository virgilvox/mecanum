class Mecanum

  constructor: (options = {cw: 'cw', ccw: 'ccw', stop: 'stop'}) ->
    @CW = options.cw
    @CCW = options.ccw
    @stop = options.stop

  move: (dir, callback) =>
    @values = []
    switch dir
      when 'forward'
        @values = [@CW, @CW, @CW, @CW]
      when 'backward'
        @values = [@CCW, @CCW, @CCW, @CCW]
      when 'left'
        @values = [@CW, @CCW, @CCW, @CW]
      when 'right'
        @values = [@CCW, @CW, @CW, @CCW]
      when 'nw'
        @values = [@stop, @CW, @CW, @stop]
      when 'ne'
        @values = [@CW, @stop, @stop, @CW]
      when 'sw'
        @values = [@CCW, @stop, @stop, @CCW]
      when 'se'
        @values = [@stop, @CCW, @CCW, @stop]
      when 'cw'
        @values = [@CW, @CW, @CCW, @CCW]
      when 'ccw'
        @values = [@CCW, @CCW, @CW, @CW]
      when 'stop'
        @values = [@stop, @stop, @stop, @stop]

    @values = {
      LF: @values[0]
      LB: @values[1]
      RF: @values[2]
      RB: @values[3]
    }

    callback @values if callback?
    return @values

module.exports = Mecanum
