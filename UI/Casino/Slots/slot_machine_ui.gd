extends Control
#class_name slot_machine_ui

var betSize : int = 0

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
	var betText = $betAmount.text

	# Remove the dollar sign and convert the remaining string to an integer
	var betValue = int(betText.substr(1, betText.length() - 1))
	print("winning bet value: ", betValue)
	
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
	SignalBank.startRoll.emit(1,2)
	SignalBank.startRoll.emit(2,2.5)
	SignalBank.startRoll.emit(3,3)



func _on_increase_bet_button_up():
	print("bet changed: ", betSize)
	betSize += 10


func _on_decrease_bet_button_up():
	print("bet changed: ", betSize)
	betSize -= 10
