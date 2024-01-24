extends AudioStreamPlayer

export var gameTracks : Dictionary

func playTrack(meditation):
	stream = gameTracks[meditation]
	play()
	
