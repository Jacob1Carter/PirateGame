extends Node3D

@export var input_shoot : String = "do_shoot"

@export var shoot_delay : float = 0.08
@export var block_time : float = 0.6
@export var cock_time : float = 0.24

var gun_state : String = "cocked"

var light_time : float = 0.05

var bulletscene = preload("res://Scenes/bullet.tscn")

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var light : OmniLight3D = $OmniLight3D
@onready var muzzle = $Marker3D


func _input(event: InputEvent) -> void:
	if event.is_action_pressed(input_shoot):
		if gun_state == "cocked":
			animation_player.play("shoot")
			await get_tree().create_timer(shoot_delay).timeout
			
			gun_state = "blocked"
			var bullet = bulletscene.instantiate()
			get_tree().current_scene.add_child(bullet)
			bullet.global_transform = muzzle.global_transform
			if bullet.has_method("set_direction"):
				bullet.set_direction(-muzzle.global_transform.basis.z.normalized())
			light.visible = true
			await get_tree().create_timer(light_time).timeout
			
			light.visible = false
			await get_tree().create_timer(block_time).timeout
			
			gun_state = "out"
		elif gun_state == "out":
			animation_player.play("cock")
			gun_state = "cocked"
