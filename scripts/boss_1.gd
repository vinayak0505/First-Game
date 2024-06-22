extends CharacterBody2D


signal died;

@export var health = 5;
@export var SPEED : int = 1;
var direction = -1;
const JUMP_VELOCITY = -90.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 0.1;

@onready var animated_sprite_2d = $AnimatedSprite2D

@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_left = $RayCastLeft
@onready var animated_sprite = $AnimatedSprite2D

var state = "idle";

@onready var collision_shape_2d = $CollisionShape2D
@onready var kill_zone = $KillZone

func _ready():
	if(direction == -1): animated_sprite.flip_h = true;
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if(state == "attack"): attack_state(delta);
	if(state == "dies"): die_state(delta);

func _on_kill_zone_body_entered(body):
	if(body.name != "Rocket"): return;
	body.queue_free();
	health -= 1;
	if(health == 0):
		dies();
	else:
		await hit();
		attack();

func attack_state(delta):
	velocity.y += gravity * delta;
	if ray_cast_right.is_colliding():
		animated_sprite.flip_h = true
		direction = -1
	if ray_cast_left.is_colliding():
		animated_sprite.flip_h = false
		direction = 1
	velocity.x += direction * SPEED;	
	if(is_on_floor_only()):
		velocity.y = JUMP_VELOCITY;
		velocity.x = direction * SPEED;
	move_and_slide()

func dies():
	state = "dies";
	animated_sprite_2d.play("dies");
	velocity.y = JUMP_VELOCITY;
	collision_shape_2d.queue_free();
	kill_zone.queue_free();
	died.emit();

func die_state(delta):
	velocity.y += gravity * delta;
	rotate(0.4 * delta)
	move_and_slide()


@onready var label = $Label

func start():
	if(state == 'start'): return;
	state = "start";
	animated_sprite_2d.play("start");
	await wait(1);
	label.show()
	await wait(1);
	label.hide()
	attack();
	
func attack():
	state = "attack";
	animated_sprite_2d.play("attack");
	
func hit():
	state = "hit";
	animated_sprite_2d.play("hit");
	await wait(1);


func _on_area_2d_body_entered(body):
	if(state != "idle"): return;
	if(body.name == "Player"): start();

	
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
