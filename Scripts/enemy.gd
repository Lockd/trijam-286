extends Node2D

@export var types: Array[Sprite2D]= []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	select_enemy_type()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func select_enemy_type():
	var type_index = randi_range(0, types.size())
	types[type_index].visible = true
	pass
