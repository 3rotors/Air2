extends CharacterBody2D
class_name Player

var grav : bool = true
const gravity = 100
const gravity_cap = 100
const rotation_speed = 0.07
const friction = 20
const top_speed = 200
var current_speed = 0
var acceleration = 400
var rotation_direction = 0
var health = 3
var shot_cd = 0
var vel := Vector2(0,0)

signal health_depeleted

@onready var main = get_tree().get_root().get_node("Game")
@onready var  bullet = load("res://Scenes/bullet.tscn")

func input (delta):
	rotation_direction = Input.get_axis("left", "right")
	
	if Input.is_action_pressed("up"):
		grav = false
		vel = transform.y * -1 * top_speed
		velocity = velocity.move_toward(vel, delta * acceleration)
	else:
		grav = true
		vel = transform.y * 0
		velocity = velocity.move_toward(vel, delta * friction)
	
	if Input.is_action_pressed("shoot"):
		shoot()

func _physics_process(delta: float) -> void:
	input(delta)
	rotation += rotation_direction * rotation_speed
	var dir := Vector2(0,0)
	dir = velocity
	if grav:
		dir.y = dir.y + 1 * gravity_cap
		velocity = velocity.move_toward(dir, delta * gravity)
	
	move_and_slide()
	


func shoot():
	if(shot_cd == 1):
		var new_bullet = bullet.instantiate()
		new_bullet.dir = rotation
		new_bullet.spawnPos = %ShootingPoint.global_position
		new_bullet.spawnRot = %ShootingPoint.rotation
		new_bullet.zdex = z_index-1
		main.add_child.call_deferred(new_bullet)
		shot_cd -=1

func _on_player_hitbox_area_entered(area: Area2D) -> void:
	health -=  1
	%HealthBar.value = health
	if health <= 0.0:
		health_depeleted.emit()


func _on_fire_rate_timeout() -> void:
	shot_cd = 1


func _on_hp_regen_timeout() -> void:
	if health < 3:
		health += 1
		%HealthBar.value = health
