extends Node2D

var speed: Vector2 = Vector2(10, 20)
@export var change:= false
var rotation_value: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = randf_range(0, 1152)
	position.y = randf_range(0, 648)

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
	rotation += delta*rotation_value
	if change:
		rotation_value = randi_range(1, 5)*((randi()%2)*2-1)
		change = false
