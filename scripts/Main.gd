extends Node
var enemy 
var enemyInstance
var enemyPathCurve

func _ready():
	enemy=preload("res://scenes/Enemy.tscn")
	enemyPathCurve= $EnemyPath.get_curve()
	$EnemyTimer.start()
	$EnemyTimer.connect("timeout",self,"_on_enemy_timer_timeout")
	$Music.play()
func _on_enemy_timer_timeout():
	enemyInstance= enemy.instance()
	enemyInstance.get_node("Sprite").scale=Vector2(7.88,7.88)
	enemyInstance.position= enemyPathCurve.get_point_position(randi() % enemyPathCurve.get_point_count())
	add_child(enemyInstance)
	
