extends AudioStreamPlayer


var sound_effects = {
	"button": preload("res://assets/audio/Sound effect/button.mp3")

}

func _ready():
	bus = "SoundEffects"

func play_sound_effect(sound_effect_name):
	if (sound_effect_name in sound_effects):
		stream = sound_effects[sound_effect_name]
		play()
		
		
   


