extends AnimatableBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	for animation_player in get_children():
		if (animation_player is AnimationPlayer):
			var points = [];
			# Get the animation data
			var animation = animation_player.get_animation("move")
			# Iterate through tracks
			for track_idx in animation.get_track_count():
				for key_idx in animation.track_get_key_count(track_idx):
					points.push_back(animation.track_get_key_value(track_idx, key_idx))
			Signals.DrawPoint.emit(points);
