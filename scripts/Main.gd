extends Node
var _enemy 
var _tree
var _enemy_path
var _tree_path
var _enemy_instance
var _tree_instance
var _path_curve
var _last_position

func _ready():
	_enemy=preload("res://scenes/Enemy.tscn")
	_tree=preload("res://scenes/Tree.tscn")
	_enemy_path= $EnemyPath
	_tree_path= $TreePath
	$EnemyTimer.start()
	$TreeTimer.start()
	$EnemyTimer.connect("timeout",self,"_on_enemy_timer_timeout")
	$TreeTimer.connect("timeout",self,"_on_tree_timer_timeout")
	$Music.play()
func _on_enemy_timer_timeout():
	_enemy_instance= _enemy.instance()
	_enemy_instance.position= _get_random_spawn_point_from_path(_enemy_path) 
	add_child(_enemy_instance)
func _on_tree_timer_timeout():
	_tree_instance= _tree.instance()
	_tree_instance.position= _get_random_spawn_point_from_path(_tree_path)
	add_child(_tree_instance)
func _get_random_spawn_point_from_path(path):	
   _path_curve = path.get_curve() 
   var random_position = _path_curve.get_point_position(randi() % _path_curve.get_point_count())
   while random_position== _last_position:
	   random_position = _path_curve.get_point_position(randi() % _path_curve.get_point_count())
   _last_position = random_position    
   return random_position
