extends AnimatedSprite

const TIMER = 0.25

var inAir = false
var walkReady = true
var crouched = false

func _on_Player_animate(motion, interacting, is_on_floor):
	if motion.y < 0:
		play("jump")
		Walk(false)
		InAir(true)
		Crouching(false)
		
	elif motion.y > 0 and inAir:
		play("landing")
		
	elif is_on_floor and inAir:
		play("land")
		InAir(false)
		
	elif motion.x != 0 and walkReady:
		play("run")
		Crouching(false)
		
	elif interacting and walkReady:
		play("crouch")
		Crouching(true)
		
	elif not interacting and crouched:
		play("uncrouch")
	elif walkReady and not crouched:
		play("idle")
	
	if motion.x > 0:
		flip_h = false
	elif motion.x < 0:
		flip_h = true


func _on_PlayerAnimation_animation_finished():
	if animation == "land":
		Walk(true)
	elif animation == "uncrouch":
		Crouching(false)


func Crouching(value):
	crouched = value
func InAir(value):
	inAir = value
func Walk(value):
	walkReady = value


