extends Area2D

class_name Enemy_Collision

var enemy_type: Enemy.enemy_types = Enemy.enemy_types.ARROW
var push_direction: Vector2 = Vector2(0, 0)

func set_enemy_type(type: Enemy.enemy_types, direction: Vector2):
	enemy_type = type
	push_direction = direction

func _on_body_entered(body: Node2D) -> void:
	print("Body entered")
	match(enemy_type):
		Enemy.enemy_types.ARROW:
			if(body.name == "Bullet"):
				body.queue_free()
				owner.player_ref.assign_target_move(push_direction)
			elif(body.name == "PlayerRB"):
				body.owner.assign_target_move(push_direction * 3)
			
			# TODO because of this enemies die if they collide with the walls. Fix it
			owner.queue_free()
			
		Enemy.enemy_types.BOMB:
			print("Collided with a bomb")
			owner.queue_free()
