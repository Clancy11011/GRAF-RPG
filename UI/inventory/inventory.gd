extends Resource

class_name Inventory

signal update

@export var slots: Array[InventorySlot]

func insert(item: InventoryItem):
	# checks to see if the item is existing, if so, will add 1 to the amount
	# What happens if it goes over the total amount?
	var itemSlots = slots.filter(func(slot): return slot.item == item)
	if !itemSlots.is_empty():
		itemSlots[0].amount += 1
	else:
		# Else, it will go to the next empty slot
		var emptySlots = slots.filter(func(slot): return slot.item == null)
		if !emptySlots.is_empty():
			emptySlots[0].item = item
			emptySlots[0].amount = 1
	update.emit()
