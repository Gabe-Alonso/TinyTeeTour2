extends Node

var cur_map = 0
var par := {
	0: 3,
	1: 6,
	2: 3,
	3: 4,
	4: 3,
	5: 6,
	6: 3,
	7: 4,
	8: 3,
	9: 6,
	10: 3
}
var scores = [0,0,0,0,0,0,0,0,0,0,0]
var shots_taken = 0
var total_shots = 0
var par_total = 0


func update_score():
	scores[cur_map] = shots_taken
	total_shots += shots_taken
	shots_taken = 0

# Called when the node enters the scene tree for the first time.
func _ready():

	for i in range(11):
		par_total += par[i]



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func next_map():
	
	update_score()
	print_debug(scores)
	cur_map = cur_map + 1
	if cur_map == 11:
		get_tree().change_scene_to_file("res://MainMenu/ScoreScreen.tscn")
	else:
		get_tree().change_scene_to_file("res://Maps/Map%d.tscn"%cur_map)

