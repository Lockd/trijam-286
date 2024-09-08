extends Node2D

@onready var pojectile_spawn_point: Node2D = $"Gun container/Pojectile spawn point"
@export var bullet: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("Player")

var moving = false
var movedir = Vector2(0, 0)
func _process(delta: float) -> void:
	if moving:
		position += movedir*delta
	pass
	
@onready var timer: Timer = $Timer

func start_moving(x ,y):
	timer.start()
	moving = true
	movedir = Vector2(position.x + x, position.y + y)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Shoot"):
		var mouse_position = get_global_mouse_position()
		var direction = mouse_position - position
		print("i shot at "  + str(direction.normalized()))
		var spawned_bullet = bullet.instantiate()
		add_child(spawned_bullet)
		spawned_bullet.global_position = pojectile_spawn_point.global_position
		spawned_bullet.newvelocity = direction.normalized()
		spawned_bullet.rotation = direction.angle()
	

func stop_moving():
	moving = false
func _on_timer_timeout() -> void:
	stop_moving()
