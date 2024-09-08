extends Area2D

var x_directions = [-10, 10, 0 ,0]
var y_directions = [0, 0, -10, 10]
func _on_body_entered(body: Node2D) -> void:
	var target_direction := Vector2(x_directions[owner.type_index], y_directions[owner.type_index])
	
	if(body.name == "Bullet"):
		body.queue_free()
		owner.player_ref.assign_target_move(target_direction)
	elif(body.name == "PlayerRB"):
		body.owner.assign_target_move(target_direction * 3)
		
	owner.queue_free()
