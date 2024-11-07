extends Node2D

@export var cell_size = Vector2i (64,64) #tamaño de cada celda

var astra_grid = AStarGrid2D.new()
var grid_size

func _ready():
	initialize_grid()

func initialize_grid():
	grid_size = Vector2i(get_viewport_rect().size) / cell_size
	astra_grid.size = grid_size
	astra_grid.cell_size = cell_size
	astra_grid.offset = cell_size/2
	astra_grid.update()

func _draw():
	draw_grid()
	
func draw_grid():
	for x in grid_size.x + 1:
		draw_line(
			Vector2(x * cell_size.x, 0), 
			Vector2(x * cell_size.x, grid_size.y * cell_size.y),
			Color.DARK_GRAY,
			2.0
		)
	for y in grid_size.y + 1:
		draw_line(
			Vector2(0, y * cell_size.y), 
			Vector2(grid_size.x * cell_size.x, y * cell_size.y),
			Color.DARK_GRAY,
			2.0
		)
