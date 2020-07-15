extends KinematicBody2D

const UP = Vector2.UP
const SPEED = 200
const GRAVITY = 10
const JUMP = 400
const BOOST = 1.25

signal animate
var motion = Vector2.ZERO
var inAir = false
var isCrouching = false
var inRange = false
var isInteracting = false
var interactFlag = false


func _physics_process(delta):
	Apply_Gravity()
	Check_Grounded()
	Collision()
	Interact()
	if not isInteracting:
		Move()
		Jump()
	Animate()
	move_and_slide(motion, UP)


func Apply_Gravity():
	if is_on_floor() and motion.y > 0:
		motion.y = 0
		inAir = false
	elif is_on_ceiling():
		motion.y = GRAVITY
	else: 
		motion.y += GRAVITY		# positive y values go down


func Jump():
	if Input.is_action_just_pressed("jump") and inAir == false:
		inAir = true
		motion.y = 0
		motion.y -= JUMP	# negative y values go up
		$CollisionShape2D.disabled = true
#		jump_sfx()


func Check_Grounded():
	if not is_on_floor():
		yield(get_tree(), "idle_frame")
		inAir = true
	else:
		inAir = false


func Boost():
	position.y -= 1
	yield(get_tree(), "idle_frame") 
	motion.y = 0
	motion.y -= JUMP * BOOST


func Collision():
	if motion.y > 0:
		$CollisionShape2D.disabled = false


func Move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
		isCrouching = false
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
		isCrouching = false
	else:
		motion.x = 0
		isCrouching = false


func Animate():
	emit_signal("animate", motion, isInteracting, is_on_floor())


func Interact():
	if inRange and Input.is_action_just_pressed("interact") and is_on_floor() and not isInteracting:
		isInteracting = true
		get_tree().call_group("interact", "Interacting")
	elif inRange and Input.is_action_just_pressed("interact") and isInteracting:
		isInteracting = false
	


func InRange(value):
	inRange = value






