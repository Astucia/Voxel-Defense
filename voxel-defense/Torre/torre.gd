extends Node3D
class_name torre

@onready var timer_disparo: Timer = $TimerDisparo
@onready var base_superior: MeshInstance3D = $BaseSuperior

@export var bala : PackedScene
@export var rango_disparo := 10.0

var camino_enemigos : Path3D
var objetivo : PathFollow3D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	objetivo = _encuentra_objetivo()
	if objetivo:
		look_at(objetivo.global_position,Vector3.UP,true)
	


func _on_timer_disparo_timeout() -> void:
	if objetivo:
		_disparo()
		
	pass # Replace with function body.

func _disparo():
	var nBala = bala.instantiate()
	add_child(nBala)
	nBala.global_position = base_superior.global_position
	nBala.direccion = global_transform.basis.z

func _encuentra_objetivo() -> PathFollow3D :
	var mejor_objetivo = null
	var mejor_progress = 0
	
	for itm in camino_enemigos.get_children():
		if itm is PathFollow3D:
			var distancia = global_position.distance_to(itm.global_position)
			
			if distancia < rango_disparo and itm.progress > mejor_progress:
				mejor_objetivo = itm
				mejor_progress = itm.progress
				
	return mejor_objetivo
