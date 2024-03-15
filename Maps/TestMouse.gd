extends Node2D

var mouse_position = null
var is_mouse_down := false
@onready var ball = $Ball
@onready var put_sound = $AudioStreamPlayer2D
var meter_buff = 4
var meter_counter = 1
var max_color = Color.WHITE


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

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



func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT && ball.get_linear_velocity().length() < 5:
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

func _draw():
	if mouse_position != null:
		var end_point = mouse_position
		var dist = ball.position.distance_to(end_point)
		var color;
		if dist > 100:
			var direction = (end_point - ball.position).normalized()
			end_point = ball.position + direction * 100
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
		if distance > 100:
			var direction = (end_point - ball.position).normalized()
			end_point = ball.position + direction * 100
		var forceX = -(end_point.x - ball.position.x) * 5
		var forceY = -(end_point.y - ball.position.y) * 5
		ball.apply_impulse(Vector2(forceX, forceY))
		put_sound.play()
		$Ball/GPUParticles2D.emitting = true

			

