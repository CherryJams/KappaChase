extends Area2D

export var moveAmount = 180

func _ready():
	$AnimatedSprite.play()
	$Timer.connect("timeout", self, "_on_Timer_timeout")
	$Timer.start(GlobalTimer.initialDelay)

func _on_Timer_timeout():
	position.y += moveAmount
	$Timer.start(GlobalTimer.beat)
	
