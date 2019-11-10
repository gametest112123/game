extends KinematicBody2D

export var player=NodePath()
export var seconds=10
export var projectile=String()
export var projspeed=100
onready var timer=Timer.new()
onready var proj=load(projectile)
onready var node=get_node(player)

func atack():
	var pos=node.position
	var dir=pos-position
	var x=proj.instance()
	x.position=position
	x.apply_impulse(Vector2.ZERO,dir.normalized()*projspeed)
	get_parent().add_child(x)
func _ready():
	$Sprite.play("animation")
	timer.set_wait_time(seconds)
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)
	timer.start()
	
func _on_timer_timeout():
	atack()
	remove_child(timer)
	timer=Timer.new()
	timer.set_wait_time(seconds)
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)
	timer.start()

func die(body):
	if body.is_in_group("player"):
		get_parent().remove_child(self)
