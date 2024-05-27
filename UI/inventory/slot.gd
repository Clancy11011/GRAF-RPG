extends PanelContainer
class_name Slot

@onready var amount_text: Label = $Control/Amount
@onready var item_visual = $TextureRect
@export_enum("NONE:0", "HEAD:1", "CHEST:2", "PANTS:3", "BOOTS:4", "ACCESSORY:5") var slot_type: int



func update(slot: InventorySlot):
	# If there is no item in slot
	if !slot.item:
		item_visual.visible = false
		amount_text.visible = false

	# If there is item in slot
	else:
		item_visual.visible = true
		item_visual.texture = slot.item.texture
		if slot.amount > 1:
			print("there's more than one!!!!!")
			amount_text.visible = true
		amount_text.text = str(slot.amount)



func _get_drag_data(at_position):
	set_drag_preview(get_preview())
	return item_visual

func _can_drop_data(at_position, data):
	return data is TextureRect
	
func _drop_data(at_position, data):
	print("dropping ak")
	var temp = item_visual.property
	item_visual.property = data.property
	data.property = temp
	
	
func get_preview():
	var preview_texture = TextureRect.new()
	preview_texture.texture = item_visual.texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(30,30)

	var preview = Control.new()
	preview.add_child(preview_texture)	
	
	return preview
	
