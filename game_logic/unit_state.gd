extends Resource
class_name UnitState

var team: Enums.Team
var max_hp: int
var level_multiplier: float
var level: int
var unit_name: String

func initalise_from_unit(unit: Unit) -> void:
	max_hp = unit.base_hp
	level_multiplier = unit.level_multiplier
	level = 1
	unit_name = unit.name

func level_up() -> void:
	max_hp *= level_multiplier
	level += 1
