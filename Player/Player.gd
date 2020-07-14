extends KinematicBody2D

const UP = Vector2.UP
const SPEED = 200
const GRAVITY = 15
const JUMP = 500

signal animate
var motion = Vector2.ZERO
var isJumping = false
var isCrouching = false


func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	Apply_Gravity()
	Jump()
	Enable_Collision()
	Move()
	Animate()
	move_and_slide(motion, UP)


func Apply_Gravity():
	if is_on_floor() and motion.y > 0:
		motion.y = 0
		isJumping = false
	elif is_on_ceiling():
		motion.y = GRAVITY
	else: 
		motion.y += GRAVITY		# positive y values go down


func Jump():
	if Input.is_action_just_pressed("jump") and isJumping == false:
		isJumping = true
		motion.y = 0
		motion.y -= JUMP	# negative y values go up
		$CollisionShape2D.disabled = true
#		jump_sfx()


func Enable_Collision():
	if motion.y > 0:
		$CollisionShape2D.disabled = false


func Move():
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		motion.x = -SPEED
		isCrouching = false
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		motion.x = SPEED
		isCrouching = false
	elif Input.is_action_pressed("down") and is_on_floor():
		isCrouching = true
	else:
		motion.x = 0
		isCrouching = false


func Animate():
	emit_signal("animate", motion, isCrouching, is_on_floor())

