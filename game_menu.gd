extends Node2D
@onready var pausemn: CanvasLayer = $pausemn
@onready var topus: Button = $topus
@onready var player: CharacterBody2D = $Player



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_hide()
	topus.visible = true
	

func _hide() -> void:
	pausemn.visible = false
	topus.visible = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _topause() -> void:
	_hide()
	pausemn.visible = true


func _Mainmn() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
