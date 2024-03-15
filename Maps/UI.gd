extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update_shot_tracker(shots_taken: int):
	$Overlay/PlayerScore.text = "Shots: %d" % shots_taken
	
func update_par_tracker(par: int):
	$Overlay/Par.text = "Par: %d" % par
