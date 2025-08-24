extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -200.0
const MAX_HEALTH = 5
const MAX_CR = 130
var HEALTH = MAX_HEALTH
var COUNTDOWN_RESPAWN = MAX_CR
var is_jumping = 0

func _physics_process(delta: float) -> void:
	if HEALTH <= 0:
		COUNTDOWN_RESPAWN -= 1
		if COUNTDOWN_RESPAWN == MAX_CR - 1:
			$AnimatedSprite2D.play("death")
			$death_music.play()
			$health_title.clear()
			$death_title.visible = true
		if COUNTDOWN_RESPAWN == 0:
			COUNTDOWN_RESPAWN = MAX_CR
			HEALTH = MAX_HEALTH
			$death_title.visible = false
		return

	$health_title.clear()
	$health_title.add_text(str(HEALTH) + "❤️")

	if not is_on_floor():
		velocity += get_gravity() * delta
	else:
		if is_jumping == 1:
			is_jumping = 0  # Reset jump state when landing

	# Handle jump
	if HEALTH > 0 and Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump")
		HEALTH -= 1
		is_jumping = 1

	# Movement
	var direction := Input.get_axis("move_left", "move_right")
	velocity.x = direction * SPEED

	if is_jumping == 0:
		if direction > 0:
			$AnimatedSprite2D.play("right")
		elif direction < 0:
			$AnimatedSprite2D.play("left")
		else:
			$AnimatedSprite2D.play("default")

	move_and_slide()
	
