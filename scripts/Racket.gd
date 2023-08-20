extends Area2D

var projectile_scene

func _ready():
    projectile_scene = preload("res://scenes/Projectile.tscn")
    $BallTimer.start()
    $BallTimer.connect("timeout", self, "_on_ball_timer_timeout")

func _on_ball_timer_timeout():
    var projectile = projectile_scene.instance()
    if is_inside_tree():  # Check if the node is still in the scene tree
        get_parent().get_parent().add_child(projectile)  # Add the projectile to the parent node
        projectile.global_position = global_position  # Set the global position of the projectile
