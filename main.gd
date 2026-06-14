extends Control
@onready var loby: AudioStreamPlayer = $Loby
@onready var tombol: VBoxContainer = $Tombol
@onready var background: Sprite2D = $Background
@onready var setting: Panel = $setting
@onready var credit: Panel = $Credit

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	main()
	loby.playing = true

func main() -> void:
	_hide()
	tombol.visible = true
	
	
func _hide() -> void:
	tombol.visible = false
	setting.visible = false
	credit.visible = false
	
func settelan() -> void:
	_hide()
	setting.visible = true

func _credit() -> void:
	_hide()
	credit.visible = true
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func Play() -> void:
	get_tree().change_scene_to_file("res://GameMenu.tscn")
