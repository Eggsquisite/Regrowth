extends AnimatedSprite

const TIMER = 0.25

var inAir = false
var walkReady = true
var crouched = false

func _on_Player_animate(motion, interacting, is_on_floor):
	if motion.y < 0:
		play("jump")
		walkReady = false
		inAir = true
	elif motion.y > 0 and inAir:
		play("landing")
	elif is_on_floor and inAir:
		play("land")
		inAir = false
		$Timer.start()
	elif motion.x != 0 and walkReady:
		play("run")
	elif interacting and walkReady:
		play("crouch")
		crouched = true
	elif not interacting and crouched:
		play("uncrouch")
		crouched = false
		# doesnt work, gets overwritten by idle
	elif walkReady:
		play("idle")
	
	if motion.x > 0:
		flip_h = false
	elif motion.x < 0:
		flip_h = true


func _on_Timer_timeout():
	walkReady = true
	$Timer.stop()

