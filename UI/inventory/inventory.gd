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


func insert_at_location(item: InventoryItem, slot_index: int):
	if slot_index < 0 or slot_index >= slots.size():
		#Invalid slot index
		return
		
	if slots[slot_index].item == item:
		#Item is already in this slot, stack it
		slots[slot_index].amount +=1
	# checks to see if the slot is empty
	
