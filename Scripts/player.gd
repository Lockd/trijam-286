extends RigidBody2D

@onready var pojectile_spawn_point: Node2D = $"Gun container/Pojectile spawn point"
@export var bullet: PackedScene

var target_position := global_position

func _ready() -> void:
	add_to_group("Player")

func _process(_delta: float) -> void:
	pass

func assign_target_move(target: Vector2) -> void:
	# TODO uncomment that if we need the movement to be independent of each other
	# set_axis_velocity(Vector2(0, 0))
	# linear_velocity = Vector2(0, 0)
	apply_central_impulse(target * 500)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Shoot"):
		var mouse_position = get_global_mouse_position()
		var direction = mouse_position - position
		var spawned_bullet = bullet.instantiate()
		get_tree().root.add_child(spawned_bullet)
		spawned_bullet.global_position = pojectile_spawn_point.global_position
		spawned_bullet.newvelocity = direction.normalized()
		spawned_bullet.rotation = direction.angle()
