extends Node2D

var mouse_position = null
var is_mouse_down := false
@onready var ball = $Ball
@onready var put_sound = $AudioStreamPlayer2D
@onready var UI = $CanvasLayer
var meter_buff = 4
var meter_counter = 1
var max_color = Color.WHITE
var shots_taken := 0
var level = 1
var max_distance = 150
var putts_disabled := false

# Called when the node enters the scene tree for the first time.
func _ready():
	UI.update_shot_tracker(shots_taken)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	@warning_ignore("integer_division", "integer_division")
	if(meter_counter == meter_buff / 2):
		max_color = Color.DARK_RED
		_draw()
	elif(meter_counter == meter_buff):
		max_color = Color.WHITE
		meter_counter = 1
		_draw()
	meter_counter = meter_counter + 1


func _toggle_zoom():
	print_debug("Camera toggled")
	$LevelCamera.enabled = not $LevelCamera.enabled
	$Ball/BallCamera.enabled = not $Ball/BallCamera.enabled

func disable_putts():
	putts_disabled = not putts_disabled


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && ball.get_linear_velocity().length() < 5 && !putts_disabled:
			if event.is_pressed():
				is_mouse_down = true
			else:
				is_mouse_down = false
				_mouse_released()
	if event is InputEventMouse and is_mouse_down:
		mouse_position = get_local_mouse_position()
	else:
		mouse_position = null
	queue_redraw()

func reset_scene():
	print_debug("reset toggled")
	var current_scene = get_tree().current_scene
	get_tree().reload_current_scene()


func _draw():
	if mouse_position != null:
		var end_point = mouse_position
		var dist = ball.position.distance_to(end_point)
		var color;
		if dist > max_distance:
			var direction = (end_point - ball.position).normalized()
			end_point = ball.position + direction * max_distance
		if dist < 25:
			color = Color.YELLOW
		elif dist < 50:
			color = Color.ORANGE
		elif dist < 75:
			color = Color.RED
		elif dist < 100:
			color = Color.DARK_RED
		else:
			color = max_color
		
		draw_line(ball.position, end_point, color, 6)
		
	
				


func _mouse_released():
	if mouse_position != null:
		var end_point = mouse_position
		var distance = ball.position.distance_to(end_point)
		if distance > 200:
			var direction = (end_point - ball.position).normalized()
			end_point = ball.position + direction * 200
		var forceX = -(end_point.x - ball.position.x) * 5
		var forceY = -(end_point.y - ball.position.y) * 5
		ball.move(forceX, forceY)
		put_sound.play()
		shots_taken += 1
		GlobalMapTracker.shots_taken += 1
		UI.update_shot_tracker(shots_taken)
		$Ball/BallHit.emitting = true

			

