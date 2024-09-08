extends AnimatedSprite2D

@export var smirk_min_cd := 8
@export var smirk_max_cd := 12

var next_smirk = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Time.get_datetime_dict_from_system() > next_smirk:
		#play("Eyes_smirk")
		#next_smirk = Time.get_datetime_dict_from_system(). + randf_range(smirk_min_cd, smirk_max_cd)
	pass
