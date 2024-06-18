extends CharacterBody2D

var _velocity = 0;
var bounce = 0.9;
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if is_on_floor():
		var angle = get_floor_angle();
		_velocity = -_velocity * bounce * (1 - angle);
		velocity.x = (velocity.x * bounce) + _velocity * angle;

	_velocity += gravity * delta;
	velocity.y = _velocity;
	
	move_and_slide()
