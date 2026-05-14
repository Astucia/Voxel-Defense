extends Control
class_name banco

@onready var txt_oro_actual: Label = $HBoxContainer/txtOroActual
@export var oro_inicial : int = 200
var oro : int = 200:
	set(_oro):
		oro = maxi(0,_oro)
		txt_oro_actual.text = str(oro)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	oro = oro_inicial
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
