extends Node2D

@export var change:= false

signal mit_signal(ingenting: String)

var rotation_value: int = 0
var is_rotating:= false
var speed: Vector2 = Vector2(10, 20)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mit_signal.connect(_on_mit_signal)
	mit_signal.emit(name)
	position.x = randf_range(0, 1152)
	position.y = randf_range(0, 648)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_rotating:
		return
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


func _on_button_pressed() -> void:
	is_rotating = not is_rotating

func _on_mit_signal(value: String) -> void:
	print(value)
