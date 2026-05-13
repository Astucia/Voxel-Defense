extends PathFollow3D
class_name enemigo

@onready var lbl_vida: Label3D = $lblVida

var vida_inicial = 42

@export var speed = 2.0
@export var hp = 10
@export var vida : int :
	set(_vida):
		vida = _vida
		lbl_vida.text = "{0} / {1}".format([vida_inicial,vida])
		var rojo: Color = Color.RED
		var amarillo: Color = Color.YELLOW
		lbl_vida.modulate = rojo.lerp(amarillo,float(vida) / float(vida_inicial))

		if vida < 1:
			queue_free()



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	vida = vida_inicial
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += speed * delta
	if progress_ratio == 1.0:
		get_tree().call_group("Castillo","quita_vida",hp)
		#var el_castillo = get_tree().get_first_node_in_group("Castillo")
		#el_castillo.quita_vida(hp)
		set_process(false)
	
	pass
