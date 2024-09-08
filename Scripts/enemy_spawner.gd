extends Node2D

var pipe = preload("res://Scenes/enemy.tscn")


@onready var spawn_shape: CollisionShape2D = %SpawnShape

@onready var player: Node2D = %Player


func  spawn_enemy():
	print("Enemy Spawned")
	var enemy = pipe.instantiate()
	owner.add_child(enemy)
	var rect : Rect2 = spawn_shape.shape.get_rect()
	var x = randi_range(rect.position.x, rect.position.x+rect.size.x)
	var y = randi_range(rect.position.y, rect.position.y+rect.size.y)
	var rand_point = global_position + Vector2(x,y)
	while (rand_point-player.position).length() < 15:
		var x_n= randi_range(rect.position.x, rect.position.x+rect.size.x)
		var y_n = randi_range(rect.position.y, rect.position.y+rect.size.y)
		rand_point = global_position + Vector2(x_n,y_n)
	enemy.global_position = rand_point
	
func _on_timer_timeout() -> void:
	spawn_enemy()
