extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	$Hole1/Score.text = str(GlobalMapTracker.scores[0])
	$Hole2/Score.text = str(GlobalMapTracker.scores[1])
	$Hole3/Score.text = str(GlobalMapTracker.scores[2])
	$Hole4/Score.text = str(GlobalMapTracker.scores[3])
	$Hole5/Score.text = str(GlobalMapTracker.scores[4])
	$Hole6/Score.text = str(GlobalMapTracker.scores[5])
	$Hole7/Score.text = str(GlobalMapTracker.scores[6])
	$Hole8/Score.text = str(GlobalMapTracker.scores[7])
	$Hole9/Score.text = str(GlobalMapTracker.scores[8])
	$Hole10/Score.text = str(GlobalMapTracker.scores[9])
	$Hole11/Score.text = str(GlobalMapTracker.scores[10])
	$Totals/ScoreTotal.text = str(GlobalMapTracker.total_shots)
	
	$Hole1/Par.text = str(GlobalMapTracker.par[0])
	$Hole2/Par.text = str(GlobalMapTracker.par[1])
	$Hole3/Par.text = str(GlobalMapTracker.par[2])
	$Hole4/Par.text = str(GlobalMapTracker.par[3])
	$Hole5/Par.text = str(GlobalMapTracker.par[4])
	$Hole6/Par.text = str(GlobalMapTracker.par[5])
	$Hole7/Par.text = str(GlobalMapTracker.par[6])
	$Hole8/Par.text = str(GlobalMapTracker.par[7])
	$Hole9/Par.text = str(GlobalMapTracker.par[8])
	$Hole10/Par.text = str(GlobalMapTracker.par[9])
	$Hole11/Par.text = str(GlobalMapTracker.par[10])
	$Totals/ParTotal.text = str(GlobalMapTracker.par_total)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
