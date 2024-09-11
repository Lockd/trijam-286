extends Node2D

@export var rotation_speed := 15 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	look_at(get_global_mouse_position())
	# add logic to flip the sprite if looking left
	pass
