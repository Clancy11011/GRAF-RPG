extends GridContainer

func _ready():
	pass
	#for i in range(9):
	#	Inventory.get_child(i)
		

func test():
	print("test!")


func update_hotbar(index: int, ID: int):
	var item_texture = load("res://Assets/items/" + ItemData.get_texture(ID))
	var item_slot_type = ItemData.get_slot_type(ID)
	var item_ATK = ItemData.get_ATK(ID)
	
	var item_data = { "TEXTURE" : item_texture,
						"ATK" : item_ATK,
						"SLOT_TYPE" : item_slot_type}
						
	if index < 10:
		get_child(index).set_property(item_data) #add item to that index

