extends Node

onready var label = $Label

var data: Dictionary = {"attack": 50, "defense": 50, "life": 50}
var savefile:= "user://data.json"


func _ready():
	label.text = "default data: " + str(data)


func _on_Save_pressed():
	var file = File.new()
	file.open(savefile, File.WRITE)
	file.store_line(to_json(data))
	file.close()
	label.text = "saved data"

func _on_Load_pressed():
	var file = File.new()
	if file.file_exists(savefile):
		file.open(savefile, File.READ)
		data = parse_json(file.get_as_text())
		file.close()
		label.text = "loaded data: " + str(data)
	else:
		label.text = "there's no saved data"

func _on_Delete_pressed():
	var dir = Directory.new()
	if dir.file_exists(savefile):
		dir.remove(savefile)
