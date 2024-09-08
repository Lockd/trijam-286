extends Node2D

var pipe = preload("res://Scenes/enemy.tscn")
@onready var player: Node2D = %Player
@onready var max_location: Node2D = $max
@onready var min_location: Node2D = $min

var x_min: float
var x_max: float
var y_min: float
var y_max: float

func _ready() -> void:
	x_min = min_location.global_position.x
	y_min = min_location.global_position.y
	x_max = max_location.global_position.x
	y_max = max_location.global_position.y

func  spawn_enemy():
	print("Enemy Spawned")
	var enemy = pipe.instantiate()
	owner.add_child(enemy)
	var is_on_x = randf() > 0.5
	var rand_position :=  Vector2(0, 0)
	
	if is_on_x:
		rand_position.x = randf_range(x_min, x_max)
		var is_top = randf() > 0.5
		if is_top:
			rand_position.y = y_max
		else:
			rand_position.y = y_min
		
	else:
		var is_left = randf() > 0.5
		if is_left:
			rand_position.x = x_min 
		else:
			rand_position.x = x_max
			
		rand_position.y = randf_range(y_min, y_max)
		
	enemy.global_position = rand_position
	
func _on_timer_timeout() -> void:
	spawn_enemy()
