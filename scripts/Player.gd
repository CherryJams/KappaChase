extends Area2D

export var moveAmount=180
export var moveCooldown=0.15
var _movement_timer
var canMove = true
var screen_size 
func _ready():
	screen_size = get_viewport_rect().size
	$AnimatedSprite.play()
	_movement_timer = $MovementCooldown
	_movement_timer.start(moveCooldown)
	_movement_timer.connect("timeout", self, "_on_MovementCooldown_timeout")
	
func _process(delta):
	if Input.is_action_pressed("move_right")&& canMove:
		position.x += moveAmount
		canMove = false
		_movement_timer.start(moveCooldown)
	if Input.is_action_pressed("move_left") && canMove: 
		position.x -= moveAmount
		canMove = false
		_movement_timer.start(moveCooldown)
		
	position.x = clamp(position.x, 240, screen_size.x-240)
	
func _on_MovementCooldown_timeout():
	canMove = true
func _on_Player_area_entered(area):
    queue_free()
		
