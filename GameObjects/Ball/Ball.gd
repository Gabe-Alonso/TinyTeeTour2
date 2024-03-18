extends RigidBody2D

var hole_layer = 1
var liquid_layer = 2
var last_pos: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	$HoleSound.play()
	last_pos = global_transform.origin
	print_debug(position)
	

func move(forceX, forceY):
	last_pos = global_transform.origin
	print_debug(position)
	apply_impulse(Vector2(forceX, forceY))
	
func stop():
	linear_velocity = Vector2.ZERO
	
func reset_pos():
	print_debug(position, last_pos)
	#position = last_pos
	global_transform.origin = last_pos
	print_debug(position, last_pos)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func win():
	GlobalMapTracker.next_map()
	
func _on_body_entered():
	$BallHit.emitting = true

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	$wallSound.play()
	$WallHit.emitting = true
	if body is TileMap:
		var tile_coords = body.get_coords_for_body_rid(body_rid)
		
		for cur_layer in body.get_layers_count():
			if cur_layer < hole_layer and cur_layer > liquid_layer:
				continue
		
			var tile_data = body.get_cell_tile_data(cur_layer, tile_coords)
			
			if not (tile_data is TileData):
				continue
			else:
				if cur_layer == hole_layer:
					
					win()
				elif cur_layer == liquid_layer:
					stop()
					reset_pos()
		
