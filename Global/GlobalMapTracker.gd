extends Node

var cur_map = 0
var par := {
	0: 3,
	1: 6,
	2: 3,
	3: 4
}
# Called when the node enters the scene tree for the first time.
func _ready():
	pass



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func next_map():
	cur_map = cur_map + 1
	get_tree().change_scene_to_file("res://Maps/Map%d.tscn"%cur_map)
