extends StaticBody3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var label: Label3D = $Label3D

var isOpen = false
var inRange = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("do_interact") && inRange:
		if isOpen:
			isOpen = false
			animation_player.play("close")
		else:
			isOpen = true
			animation_player.play("open")
		
		


func _on_area_3d_body_entered(body: Node3D) -> void:
	label.visible = true
	inRange = true


func _on_area_3d_body_exited(body: Node3D) -> void:
	label.visible = false
	inRange = false
