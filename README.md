## Mecanum

This library is just a helper to work with a mecanum wheel configuration.
Set the values for cw, ccw, and stop and the mecanum helper will spit out the values to set each motor/servo at.

### To install

```
npm install mecanum
```

### Require it in your code.

```js
var Mecanum = require('mecanum')
// Set the base values for your motor or servo
```

### Set the values for cw, ccw, and stop and the mecanum helper will spit out the values to set each motor/servo at.

```js
var mec = new Mecanum({
    'cw': 60,
    'ccw': 40,
    'stop': 51,
  });
```

### Call as a function

``js
var values = mec.move('forward');
```

### Or as a callback

``js
mec.move('forward', function(data){
    console.log(data);
  });
```

### Returns

```json
{ "LF": 60,
  "LB": 60,
  "RF": 60,
  "RB": 60
}
```

### Use the values to set your motors.

```js
 This part will be different based on what robotics library
 you are using, but it gives you the idea.

left_front_motor.speed(values.LF);
left_back_motor.speed(values.LB);
right_front_motor.speed(values.RF);
right_back_motor.speed(values.RB);

```

### With johnny-five continuous servos

```js
var five = require("johnny-five");
var Mecanum = require('mecanum')
// Don't provide options and it will default to servo settings
// which is to say it will return string 'cw', 'ccw', or 'stop'
var mec = new Mecanum();
var board = new five.Board();

  board.on("ready", function() {
    var leftb  = new five.Servo.Continuous(3).stop();
    var leftf  = new five.Servo.Continuous(5).stop();
    var rightf = new five.Servo.Continuous(6).stop();
    var rightb = new five.Servo.Continuous(9).stop();

    mec.move('forward', function(values){
      leftf[values.LF];
      leftb[values.LB];
      rightf[values.RF];
      rightb[values.RB];
    });  
  });

```

### With Johnny-Five ESC

```js
var five = require("johnny-five");
var Mecanum = require('mecanum')
var mec = new Mecanum({
    'cw': 60,
    'ccw': 40,
    'stop': 51,
  });

  var board = new five.Board();

  board.on("ready", function() {
    var leftf = new five.ESC({
        device: "FORWARD_REVERSE",
        neutral: 50,
        pin: 9
      });

      var leftb = new five.ESC({
        device: "FORWARD_REVERSE",
        neutral: 50,
        pin: 5
      });

      var rightb = new five.ESC({
        device: "FORWARD_REVERSE",
        neutral: 50,
        pin: 3
      });

      var rightf = new five.ESC({
        device: "FORWARD_REVERSE",
        neutral: 50,
        pin: 6
      });

    mec.move('forward', function(values){
      leftf.speed(values.LF);
      leftb.speed(values.LB);
      rightf.speed(values.RF);
      rightb.speed(values.RB);
    });  
  });
```
