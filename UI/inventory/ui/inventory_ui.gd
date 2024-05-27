extends Control

@onready var invMain: Inventory = preload("res://Characters/Players/player_inventory.tres")
@onready var invLeftArmor: Inventory = preload("res://Characters/Players/player_armor_left.tres")
@onready var invRightArmor: Inventory = preload("res://Characters/Players/player_armor_right.tres")
@onready var slotsMain: Array = $NinePatchRect/maininventory.get_children()
@onready var slotsLeft: Array = $NinePatchRect/leftSlots.get_children()
@onready var slotsRight: Array = $NinePatchRect/rightSlots.get_children()

var is_open = false


# Called when the node enters the scene tree for the first time.
func _ready():
	invMain.update.connect(update_slots)
	update_slots()
	close()
	pass # Replace with function body.
	

func update_slots():
	#update the main inv slots
	for i in range(min(invMain.slots.size(), slotsMain.size())):
		slotsMain[i].update(invMain.slots[i])
		
	#update the left armor inv slots
	for i in range(min(invLeftArmor.slots.size(), slotsLeft.size())):
		slotsLeft[i].update(invLeftArmor.slots[i])
	
	# update the right armor inv slots
	for i in range(min(invRightArmor.slots.size(), slotsRight.size())):
		slotsRight[i].update(invRightArmor.slots[i])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("q"):
		if is_open:
			close()
		else:
			open()
	pass


func close():
	visible = false
	is_open = false


func open():
	visible = true
	is_open = true
