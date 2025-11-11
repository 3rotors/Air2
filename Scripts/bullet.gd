extends CharacterBody2D
class_name Bullet

@export var speed = 1000
@export var damage = 1
const range = 1500
var travel_distance = 0

var dir : float
var spawnPos : Vector2
var spawnRot : float
var zdex : int

func _ready():
	global_position = spawnPos
	global_rotation = spawnRot
	z_index = zdex

func _physics_process(delta: float) -> void:
	var direction = Vector2.UP.rotated(dir)
	position += direction * speed * delta
	travel_distance += speed * delta
	if travel_distance > range:
		queue_free()

func _on_hitbox_area_entered(area: Area2D) -> void:
	queue_free()
	if area.has_method("take_damage"):
		area.take_damage()
