extends Node2D

var total_mobs = 30

func _ready():
	Global.score=0
	Global.mob_count=0

func spawn_mob():
	var new_mob = preload("res://Scenes/enemy1.tscn").instantiate()
	%MobSpawnPath.progress_ratio = randf()
	new_mob.global_position = %MobSpawnPath.global_position
	add_child(new_mob)

func _on_mob_timer_timeout() -> void:
	if Global.mob_count < total_mobs:
		spawn_mob()
