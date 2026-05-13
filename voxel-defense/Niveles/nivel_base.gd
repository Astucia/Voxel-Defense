extends Node3D

@export var modelo_torre : PackedScene
@onready var grid_map: GridMap = $GridMap
@onready var camino_principal: Path3D = $CaminoPrincipal


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_camera_picker_celda_seleccionada(_cell: Vector3i, _collision_point: Vector3) -> void:
	var torre = modelo_torre.instantiate()
	add_child(torre)
	var n_pos = grid_map.map_to_local(_cell)
	torre.global_position = n_pos
	torre.camino_enemigos = camino_principal
	
	
	pass # Replace with function body.
