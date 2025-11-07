## This class keeps track of unit starting positions
extends Resource
class_name UnitGrid

var map_size_width := 10
var map_size_height := 6
var friendly_height := 3

signal unit_added(position: Vector2i, unit: UnitState)

var grid: Dictionary[Vector2i, UnitState] = {}

func add_unit(position: Vector2i, unit: UnitState) -> void:
	if position.x >= map_size_width:
		return
	if position.x < 0:
		return
	if unit.team == Enums.Team.PLAYER and (position.y >= friendly_height or position.y < 0):
		return
	if unit.team == Enums.Team.ENEMY and (position.y < friendly_height or position.y >= map_size_height):
		print("Illegal enemy placement")
		return
	
	grid[position] = unit
	unit_added.emit(position, unit)
	
func remove_unit(position: Vector2i) -> void:
	grid.erase(position)

func is_tile_occupied(position: Vector2i) -> bool:
	return grid.has(position)
	
func get_all_units() -> Array[UnitState]:
	return grid.values() as Array[UnitState]
