extends Node
class_name manejador_de_dificultad

@export var tiempo_oleada : float = 30.0
@onready var timer: Timer = $Timer
@export var curva_spawn : Curve
@export var curva_vida : Curve

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.wait_time = tiempo_oleada
	timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#print(game_progress_ratio())
	#print(get_spawn_time())
	pass

func game_progress_ratio() -> float:
	return 1.0 - (timer.time_left / tiempo_oleada)
	
func get_spawn_time() -> float:
	return curva_spawn.sample(game_progress_ratio())
