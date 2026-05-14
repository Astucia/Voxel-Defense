extends PathFollow3D
class_name enemigo

@onready var lbl_vida: Label3D = $lblVida
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var enemy_animation_player: AnimationPlayer = $Skeleton_Warrior/EnemyAnimationPlayer
@onready var animation_timer: Timer = $AnimationTimer
@onready var mi_banco = get_tree().get_first_node_in_group("Banco")

var vida_inicial = 42

@export var speed = 2.0
@export var hp = 10
@export var monedas = 50
@export var vida : int :
	set(_vida):
		vida = _vida
		lbl_vida.text = "{0} / {1}".format([vida_inicial,vida])
		var rojo: Color = Color.RED
		var amarillo: Color = Color.YELLOW
		lbl_vida.modulate = rojo.lerp(amarillo,float(vida) / float(vida_inicial))

		if vida < 1:
			mi_banco.oro += monedas
			queue_free()



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	vida = vida_inicial
	animation_timer.start(randf_range(.01,1.3))
	
	
	
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

func _impacto(_hp):
	vida -= _hp
	animation_player.play("impacto")


func _on_animation_timer_timeout() -> void:
	var anim = enemy_animation_player.get_animation("Running_A")
	anim.loop_mode = Animation.LOOP_LINEAR
	enemy_animation_player.play("Running_A")
	pass # Replace with function body.
