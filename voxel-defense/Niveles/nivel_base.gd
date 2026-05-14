extends Node3D

@export var modelo_torre : PackedScene
@onready var grid_map: GridMap = $GridMap
@onready var camino_principal: Path3D = $CaminoPrincipal
@onready var mi_banco: banco = $Banco



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_camera_picker_celda_seleccionada(_cell: Vector3i, _collision_point: Vector3) -> void:
	 
	var torre = modelo_torre.instantiate()
	if mi_banco.oro >= torre.costo_torre:
		add_child(torre)
		var n_pos = grid_map.map_to_local(_cell)
		torre.global_position = n_pos
		torre.camino_enemigos = camino_principal
		mi_banco.oro -= torre.costo_torre
	else:
		torre.queue_free()
	
	
	pass # Replace with function body.
