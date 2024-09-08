extends Node2D

@export var types: Array[Sprite2D]= []
var active_sprite : Sprite2D
@export var jump_cooldown := 1.3
@export var jump_duration := 1
@export var jump_distance := 1.5
@onready var shadow: Sprite2D = $Shadow

var next_jump: float = 0
var is_jumping := false
var jump_start_time : float = 0

var jump_start_point: Vector2
var jump_mid_point: Vector2
var jump_end_point: Vector2
var ground_mid_point: Vector2

@onready var player_ref : Player = %Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	select_enemy_type()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var current_time = Time.get_unix_time_from_system()
	if next_jump < current_time and !is_jumping:
		print("should start jump " + str(current_time))
		is_jumping = true
		next_jump = current_time + jump_cooldown + jump_cooldown
		jump_start_time = current_time
		jump_start_point = position
		jump_end_point = jump_start_point + (player_ref.position - position).normalized() * jump_distance
		ground_mid_point = jump_start_point + (jump_end_point - jump_start_point) / 2
		jump_mid_point = ground_mid_point + Vector2(0, -25)
		active_sprite.scale = Vector2(0.75, 1.25)
	
	if is_jumping:
		var target_position = _quadratic_bezier(jump_start_point, jump_mid_point, jump_end_point, current_time - jump_start_time)
		position = target_position
		
		var target_shadow_position = _quadratic_bezier(jump_start_point, ground_mid_point, jump_end_point, current_time - jump_start_time)
		shadow.global_position = target_shadow_position - Vector2(0, -10)
		
	if (current_time - jump_start_time) > jump_duration and is_jumping:
		print("should stop jumping " + str(current_time))
		active_sprite.scale = Vector2(1.25, 0.75)
		is_jumping = false
		
	active_sprite.scale.x = move_toward(active_sprite.scale.x, 1, 0.8 * delta)
	active_sprite.scale.y = move_toward(active_sprite.scale.y, 1, 0.8 * delta)
	
	
func select_enemy_type():
	var type_index = randi_range(0, types.size() - 1)
	types[type_index].visible = true
	active_sprite = types[type_index]

func _quadratic_bezier(p0: Vector2, p1: Vector2, p2: Vector2, t: float) -> Vector2:
	var q0 = p0.lerp(p1, t)
	var q1 = p1.lerp(p2, t)
	var r = q0.lerp(q1, t)
	return r
	
