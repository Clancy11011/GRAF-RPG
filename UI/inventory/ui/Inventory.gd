extends GridContainer

# testing purposes only
#func _ready():
#	add_item("0")
#	add_item("1")
#add_item("2")

func add_item(ID="0"):
	var item_texture = load("res://Assets/items/" + ItemData.get_texture(ID))
	var item_slot_type = ItemData.get_slot_type(ID)
	var item_ATK = ItemData.get_ATK(ID)
	
	var item_data = { "TEXTURE" : item_texture,
						"ATK" : item_ATK,
						"SLOT_TYPE" : item_slot_type}
						
	#get_child(0).set_property(item_data)
	
	var index = 0
	for i in get_children(): #traverse through all slots
		if i.filled == false:
			index = i.get_index() #get index of first unfilled slot
			break
	get_child(index).set_property(item_data) #add item to that index
