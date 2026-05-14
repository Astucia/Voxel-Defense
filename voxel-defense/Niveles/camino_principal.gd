extends Path3D
class_name camino_principal

@onready var timer: Timer = $Timer
@export var dificultad : Node
const ENEMIGO = preload("uid://bu1woi2cbal8y")



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	_crea_enemigo()
	pass # Replace with function body.
	
func _crea_enemigo():
	var nEnemigo = ENEMIGO.instantiate()
	add_child(nEnemigo)
	timer.wait_time = dificultad.get_spawn_time()
	
	
