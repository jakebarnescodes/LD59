extends HSlider

func _on_value_changed(val: float) -> void:
	var bus = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus, linear_to_db(val))
	var db = AudioServer.get_bus_volume_db(bus)
	print(db)
