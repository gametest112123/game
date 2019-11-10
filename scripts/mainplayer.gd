extends KinematicBody2D
export var speed=1
export var jump=1
export var maxspeed=1
export var maxverticalspeed=1
export var gravity=1
export var groundfriction=float()
export var airfriction=float()
export var level=String()

const up=Vector2(0,-1)
var vel=Vector2()
var grounded
var friction;

func _physics_process(delta):
	grounded=is_on_floor()
	
	
	if grounded:
		vel.y=0
	else:
		vel.y+=gravity
		
		
	if Input.is_action_pressed("jump") and grounded:
		vel.y=-jump
	if Input.is_action_pressed("ui_right"):
		vel.x+=speed
	else:
		friction=true
	if Input.is_action_pressed("ui_left"):
		vel.x+=-speed
	else:
		friction=true
	if abs(vel.x)>maxspeed:
		if vel.x>0:
			vel.x=maxspeed
		else:
			vel.x=-maxspeed
	if abs(vel.y)>maxverticalspeed:
		if vel.y>0:
			vel.y=maxverticalspeed
		else:
			vel.y=-maxverticalspeed
	
	if friction:
		if grounded:
			vel.x*=groundfriction
		else:
			vel.x*=airfriction
	move_and_slide(vel,up)

func i_think_kill(body):
	if body.is_in_group("projkill"):
		get_tree().change_scene(level)
