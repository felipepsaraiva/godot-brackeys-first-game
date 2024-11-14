extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
    # Add the gravity.
    if not is_on_floor():
        velocity += get_gravity() * delta

    # Handle jump.
    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = JUMP_VELOCITY

    # Get the input direction
    var direction := Input.get_axis("move_left", "move_right")

    # Flip direction to face the movement
    if direction != 0:
        $AnimatedSprite2D.flip_h = direction < 0

    # PLay animation
    if not is_on_floor():
        $AnimatedSprite2D.play("jump")
    elif direction == 0:
        $AnimatedSprite2D.play("idle")
    else:
        $AnimatedSprite2D.play("run")

    # Handle movement
    if direction:
        velocity.x = direction * SPEED
    else:
        velocity.x = move_toward(velocity.x, 0, SPEED)

    move_and_slide()
