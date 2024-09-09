extends Area2D

class_name Enemy_Collision

var x_directions = [-10, 10, 0 ,0]
var y_directions = [0, 0, -10, 10]

var enemy_type: Enemy.enemy_types = Enemy.enemy_types.ARROW

func set_enemy_type(type: Enemy.enemy_types):
	enemy_type = type

func _on_body_entered(body: Node2D) -> void:
	match(enemy_type):
		Enemy.enemy_types.ARROW:
			var target_direction := Vector2(x_directions[owner.type_index], y_directions[owner.type_index])
			if(body.name == "Bullet"):
				body.queue_free()
				owner.player_ref.assign_target_move(target_direction)
			elif(body.name == "PlayerRB"):
				body.owner.assign_target_move(target_direction * 3)
			owner.queue_free()
			
		Enemy.enemy_types.BOMB:
			print("Collided with a bomb")
			owner.queue_free()
