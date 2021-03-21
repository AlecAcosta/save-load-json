extends Node


func _ready():
	var data = loadJson("res://myFile.json")
	
	#print the entire Dictionary (var data)
	$Label.text = String(data)

	#print the first item in "items"
	$Label.text += "\n\n" + String(data["items"][0])



func loadJson(_jsonDir):
	_jsonDir
	var jsonFile = File.new()
	var jsonData: Dictionary
	jsonFile.open(_jsonDir,File.READ)
	jsonData = parse_json(jsonFile.get_as_text())
	jsonFile.close()
	
	return jsonData
