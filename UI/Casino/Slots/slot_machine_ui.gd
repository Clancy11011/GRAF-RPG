extends Control
#class_name slot_machine_ui

var reelResult1
var reelResult2
var reelResult3

var receivedHowManyTimes = 0

var betValue
var betResult
var winningMultiplier = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	#visible = false
	SignalBank.rollFinished.connect(Callable(self,"_receiveNumber"))
	pass # Replace with function body.
	
	
func _receiveNumber(reelID,rngResult):
	receivedHowManyTimes +=1
	match reelID:
		1:
			reelResult1 = rngResult
		2:
			reelResult2 = rngResult
		3:
			reelResult3 = rngResult
	if receivedHowManyTimes <3:
		print(receivedHowManyTimes)
		
	else:
		receivedHowManyTimes = 0
		_calculateWinning()


func _calculateWinning():
	betValue = int($betAmount.value)
	
	
	if reelResult1 == reelResult2 || reelResult2 == reelResult3:
		winningMultiplier = 5
	elif  reelResult1 == reelResult2 && reelResult2 == reelResult3:
		winningMultiplier = 100
	else :
		winningMultiplier = -1
	betResult = betValue * winningMultiplier
	print(str(betResult))
	#if betResult>0:
	#	$Result.text = "+ "+str(betResult)
	#else:
	#	$Result.text = "LMAO !!!!  "+str(betResult)
	

func _on_spin_button_up():
	print("spinning slot")
	SignalBank.startRoll.emit(1,2)
	SignalBank.startRoll.emit(2,2.5)
	SignalBank.startRoll.emit(3,3)
	pass # Replace with function body.

