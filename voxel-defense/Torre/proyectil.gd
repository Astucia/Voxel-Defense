extends Area3D
class_name proyectil

var direccion := Vector3.FORWARD
@export var velocidad := 10.0
@export var hp := 25
@export var tiempo_de_vida = 4.0

@onready var timer: Timer = $Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start(tiempo_de_vida)
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	position += direccion * velocidad * delta
	
	
func _on_timer_timeout() -> void:
	queue_free()
	pass # Replace with function body.


func _on_area_entered(area: Area3D) -> void:
	
	var enemy = area.get_parent()
	if enemy is enemigo:
		enemy._impacto(hp)
		queue_free()
		
	pass # Replace with function body.
