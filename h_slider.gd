extends HSlider

@export var audio_bus_name: String
var bebaslah

func _ready() -> void:
	bebaslah = AudioServer.get_bus_index(audio_bus_name)
func _on_value_changed(value: float) -> void:
	var gogok = linear_to_db(value)
	AudioServer.set_bus_volume_db(bebaslah,gogok)
