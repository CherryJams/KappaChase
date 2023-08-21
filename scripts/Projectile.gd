extends Area2D

export var moveAmount = 180
func _ready():
	$Timer.connect("timeout", self, "_on_Timer_timeout")
	$Timer.start(GlobalTimer.initialDelay/4)

func _on_Timer_timeout():
	position.y -= moveAmount
	$Timer.start(GlobalTimer.beat/4)
func _on_Projectile_area_entered(area):
    if area.name == "Enemy":
        print("Enemy hit!")
        area.queue_free()
        queue_free()
    else:
        print("Non-enemy area entered:", area.name)
