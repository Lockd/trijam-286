extends Node2D

@onready var pojectile_spawn_point: Node2D = $"Gun container/Pojectile spawn point"
@export var bullet: PackedScene
@export var movement_speed := 15

var moving = false
var target_position := global_position

func _ready() -> void:
	add_to_group("Player")

func _process(delta: float) -> void:
	# gradually move
	if moving:
		position = position.move_toward(target_position, delta * movement_speed)
	# stop moving
	if global_position.distance_to(target_position) < 1:
		moving=false 

func assign_target_move(target: Vector2) -> void:
	target_position = global_position + target * 10
	moving = true

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Shoot"):
		var mouse_position = get_global_mouse_position()
		var direction = mouse_position - position
		var spawned_bullet = bullet.instantiate()
		add_child(spawned_bullet)
		spawned_bullet.global_position = pojectile_spawn_point.global_position
		spawned_bullet.newvelocity = direction.normalized()
		spawned_bullet.rotation = direction.angle()
