@tool
extends Node3D
class_name gridprocedural

enum eLocetas {Base,Enemigos,Entrada,Items,Limite,Otro,Relleno,Salida}

@export var tipoLoceta : eLocetas = eLocetas.Relleno

@onready var grid_map: GridMap = $GridMap

var txt_map: String = "XXXXXXXXXX
XIXXXXXXXX
XXXXXXXXXX
XXXXXXXXXX
XXXXXXXXXX
XXXXXXXXXX
XXXXXXXXXX
XXXXXXXXXX
XXXXXXXXSX
XXXXXXXXXX
"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_crea_cuadro()
	pass # Replace with function body.

func _crea_cuadro():
	var nX
	var nZ
	
	for n_Z in range(-5,5):
		nZ = n_Z
		for n_X in range(-5,5):
			nX = n_X
			grid_map.set_cell_item(Vector3i(nX,0,nZ),tipoLoceta,0)
			
func _limpiaGrid():
	grid_map.clear()
	
	
func _cambia_loceta(nX: int,nZ: int, _tipoloceta: eLocetas = eLocetas.Relleno):
	grid_map.set_cell_item(Vector3i(nX,0,nZ),_tipoloceta,0)
	pass 
	
func _lee_txt_map():
	var nX = -5
	var nZ = -5
	var tileTipo = 0
	
	for chr in txt_map:
		var IsBreak = false
		match chr:
			"B": tileTipo = eLocetas.Base
			"E": tileTipo = eLocetas.Enemigos
			"I": tileTipo = eLocetas.Entrada
			"T": tileTipo = eLocetas.Items
			"L": tileTipo = eLocetas.Limite
			"X": tileTipo = eLocetas.Relleno
			"S": tileTipo = eLocetas.Salida
			"\n": 
				nX = -5
				nZ+=1
				IsBreak = true
			_:
				printt("Code RR:",chr.unicode_at(0))
			
		if !IsBreak:
			_cambia_loceta(nX,nZ,tileTipo)
			nX+=1
			
			
		printt("X:",nX,"Z:",nZ,"Chr:", chr,"Code:",chr.unicode_at(0))
	
	
	
	
	
	
	
	
