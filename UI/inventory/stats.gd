extends TextureRect

@export var slot_type: int = 0
@export var amount: int = 0

#@export var amount = 0:
#	set(value):
#		amount = value
#		%amount.text = str(amount)

@onready var property: Dictionary = {"TEXTURE": texture,
									"AMOUNT": amount,
									"SLOT_TYPE": slot_type }:
	set(value):
		property = value
		
		texture = property["TEXTURE"]
		amount = property["AMOUNT"]
		slot_type = property["SLOT_TYPE"]
