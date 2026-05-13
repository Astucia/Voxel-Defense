extends MeshInstance3D

@onready var lbl_vida: Label3D = $lblVida

@export var vida_inicial : int = 100

var vida : int :
	set(_nueva_vida):
		vida = _nueva_vida
		lbl_vida.text = "{0} / {1}".format([vida_inicial,vida])
		var rojo: Color = Color.RED
		var amarillo: Color = Color.YELLOW
		lbl_vida.modulate = rojo.lerp(amarillo,float(vida) / float(vida_inicial))
		
		if vida < 1:
			get_tree().reload_current_scene()
		


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	vida = vida_inicial
	pass # Replace with function body.


func quita_vida(hp):
	vida -= hp
	
	
