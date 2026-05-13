@tool
extends Node3D
class_name nivel_procedural
@onready var Terreno: gridprocedural = $Terreno
@onready var camera_picker: camera_picker = $CameraPicker
@onready var lbl_loceta: Label = $CanvasLayer/lblLoceta


func _input(event: InputEvent) -> void:
	
	if event.is_action_pressed("pinta_cuadro"):
		#Terreno._crea_cuadro()
		Terreno._lee_txt_map()
		
	if event.is_action_pressed("limpiar_grid"):
		Terreno._limpiaGrid()
		
	if event.is_action_pressed("tile1"):
		Terreno.tipoLoceta = gridprocedural.eLocetas.Base
		#camera_picker.tipo_loceta = Terreno.tipoLoceta
		lbl_loceta.text = str(Terreno.tipoLoceta)
		#Terreno._crea_cuadro()
	
	if event.is_action_pressed("tile2"):
		Terreno.tipoLoceta = gridprocedural.eLocetas.Enemigos
		#camera_picker.tipo_loceta = Terreno.tipoLoceta
		lbl_loceta.text = str(Terreno.tipoLoceta)
		#Terreno._crea_cuadro()
	
	if event.is_action_pressed("tile3"):
		Terreno.tipoLoceta = gridprocedural.eLocetas.Limite
		#camera_picker.tipo_loceta = Terreno.tipoLoceta
		lbl_loceta.text = str(Terreno.tipoLoceta)
		#Terreno._crea_cuadro()

	if event.is_action_pressed("eliminar_loceta"):
		Terreno.tipoLoceta = -1
		lbl_loceta.text = str(Terreno.tipoLoceta)
	
	
	
	if event.is_action_pressed("al_azar"):
		var nX = randi_range(-5,4)
		var nZ = randi_range(-5,4)
		var _Loceta = randi_range(0,7)
		Terreno._cambia_loceta(nX,nZ,_Loceta)
	


func _on_camera_picker_celda_seleccionada(_cell: Vector3i, _collision_point: Vector3) -> void:
	Terreno._cambia_loceta(_cell.x,_cell.z,Terreno.tipoLoceta)
	pass # Replace with function body.
