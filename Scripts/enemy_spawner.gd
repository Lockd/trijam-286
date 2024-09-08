extends Node2D

var pipe = preload("res://Scenes/enemy.tscn")

func  spawn_enemy():
	print("Enemy Spawned")
	var enemy = pipe.instantiate()
	owner.add_child(enemy)
	enemy.global_position = global_position
	
func _on_timer_timeout() -> void:
	spawn_enemy()
