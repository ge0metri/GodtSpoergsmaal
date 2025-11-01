extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = randf_range(0, 1152)
	position.y = randf_range(0, 648)

var speed: Vector2 = Vector2(10, 20)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.y > 648:
		speed.y *= -1
	if position.y < 0:
		speed.y *= -1
	if position.x > 1152:
		speed.x *= -1
	if position.x < 0:
		speed.x *= -1
	position += speed*delta
