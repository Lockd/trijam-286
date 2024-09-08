extends Node2D

@onready var pojectile_spawn_point: Node2D = $"Gun container/Pojectile spawn point"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

var pipe = preload("res://Scenes/bullet.tscn")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Shoot"):
		var mouse_position = get_global_mouse_position()
		var direction = mouse_position - position
		print("i shot at "  + str(direction.normalized()))
		var bullet = pipe.instantiate()
		owner.add_child(bullet)
		bullet.global_position = pojectile_spawn_point.global_position
		bullet.newvelocity = direction.normalized()
		bullet.rotation = direction.angle()
	
