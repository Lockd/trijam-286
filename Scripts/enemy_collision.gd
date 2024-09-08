extends Area2D

var x_directions = [-10, 10, 0 ,0]
var y_directions = [0, 0, -10, 10]
func _on_body_entered(body: Node2D) -> void:
	if(body.name == "Bullet"):
		body.queue_free()
		owner.player_ref.move_local_x(x_directions[owner.type_index])
		owner.player_ref.move_local_y(y_directions[owner.type_index])
	elif(body.name == "PlayerRB"):
		body.owner.move_local_x(x_directions[owner.type_index])
		body.owner.move_local_y(y_directions[owner.type_index])
		
	owner.queue_free()
