extends CharacterBody2D

const SPEED = 20000

@onready var timer: Timer = $Timer

var newvelocity = Vector2(1 ,1)

func _physics_process(delta: float) -> void:
	velocity = newvelocity*delta*SPEED
	move_and_slide()
	
	


func _on_timer_timeout() -> void:
	queue_free()
