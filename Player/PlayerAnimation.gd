extends AnimatedSprite

const TIMER = 0.25

var inAir = false
var walkReady = true

func _on_Player_animate(motion, crouch, land):
	if motion.y < 0:
		play("jump")
		walkReady = false
		inAir = true
	elif motion.y > 0 and inAir:
		play("landing")
	elif land and inAir:
		play("land")
		inAir = false
		$Timer.start()
	elif motion.x != 0 and walkReady:
		play("run")
	elif crouch and walkReady:
		play("crouch")
	elif walkReady:
		play("idle")
	
	if motion.x > 0:
		flip_h = false
	elif motion.x < 0:
		flip_h = true



func _on_Timer_timeout():
	walkReady = true
	$Timer.stop()
