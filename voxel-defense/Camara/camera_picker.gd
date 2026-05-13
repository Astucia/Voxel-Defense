extends Camera3D
class_name camera_picker

@onready var ray_cast_3d: RayCast3D = $RayCast3D
signal celda_seleccionada(_cell:Vector3i,_collision_point:Vector3)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var mouse_position : Vector2 = get_viewport().get_mouse_position()
	ray_cast_3d.target_position = project_local_ray_normal(mouse_position) * 100
	ray_cast_3d.force_raycast_update()
	
	if ray_cast_3d.is_colliding():
		var collider = ray_cast_3d.get_collider()
		if collider is GridMap:
			var collision_point = ray_cast_3d.get_collision_point()
			var cell = collider.local_to_map(collision_point)
			
			if Input.is_action_just_pressed("cambia_celda"):
				celda_seleccionada.emit(cell,collision_point)
				#collider.set_cell_item(cell,tipo_loceta)
			
			#print(cell)
	
	
	
	pass
