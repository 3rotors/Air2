extends CharacterBody2D


@onready var player = get_node("/root/Game/Player")

var health = 1
var speed = 120

func _ready():
	Global.mob_count +=1

func _physics_process(delta: float) -> void:
	var direction = global_position.direction_to(player.global_position)
	look_at(player.position)
	velocity = direction * speed
	move_and_slide()

func take_damage():
	health-=1
	if health == 0:
		Global.mob_count -=1
		Global.score += 1
		queue_free()

func _on_enemy_hitbox_area_entered(area: Area2D) -> void:
	take_damage()
