# TODO read more about @tool
@tool
extends Timer
class_name RandomTimer

@export var min_time := 0.5
@export var max_time := 1.5

func _validate_property(property: Dictionary) -> void:
	if property.name == "wait_time":
		# TODO wtf is &= operatior? is it a xor?
		property.usage &= -PROPERTY_USAGE_EDITOR

func get_random_time():
	return randf_range(min_time, max_time)

func _on_timeout():
	self.wait_time = get_random_time()

func _ready() -> void:
	self.timeout.connect(_on_timeout)
	self.wait_time = get_random_time()
