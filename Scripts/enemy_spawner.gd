extends Node2D

var pipe = preload("res://Scenes/enemy.tscn")
@onready var spawn_enemies_timer: RandomTimer = $SpawnEnemiesTimer
@onready var wave_pause_timer: Timer = $WavePauseTimer

# In every scene where we add this logic we should also adjust min and max
@onready var max_location: Node2D = $max
@onready var min_location: Node2D = $min
var x_min: float
var x_max: float
var y_min: float
var y_max: float

@export_category("Enemy Waves")
@export var pause_between_waves := 3
@export var enemies_per_wave: int = 8
var spawned_enemies: int = 0

func _ready() -> void:
	x_min = min_location.global_position.x
	y_min = min_location.global_position.y
	x_max = max_location.global_position.x
	y_max = max_location.global_position.y
	
	wave_pause_timer.wait_time = pause_between_waves

func  spawn_enemy():
	var enemy: Enemy = pipe.instantiate()
	owner.add_child(enemy)
	enemy.select_enemy_type()
	spawned_enemies += 1
	var rand_position = get_spawn_position()
	enemy.global_position = rand_position
	
	if spawned_enemies >= enemies_per_wave:
		spawn_enemies_timer.stop()
		wave_pause_timer.start()
		spawned_enemies = 0
	

func get_spawn_position() -> Vector2:
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
		rand_position.y = randf_range(y_min, y_max)
		var is_left = randf() > 0.5
		if is_left:
			rand_position.x = x_min 
		else:
			rand_position.x = x_max
	return rand_position


func _on_spawn_enemies_timeout() -> void:
	spawn_enemy()


func _on_wave_pause_timer_timeout() -> void:
	spawn_enemy()
	spawn_enemies_timer.start()
	wave_pause_timer.stop()
