extends Node

var hole_layer = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func win():
	GlobalMapTracker.next_map()
	

func _on_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if body is TileMap:
		var tile_coords = body.get_coords_for_body_rid(body_rid)
		
		for cur_layer in body.get_layers_count():
			if cur_layer != 1:
				continue
		
			var tile_data = body.get_cell_tile_data(cur_layer, tile_coords)
			
			if not (tile_data is TileData):
				continue
			else:
				if cur_layer == hole_layer:
					win()
		
