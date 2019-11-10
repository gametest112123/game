extends RigidBody2D

var timer=Timer.new()

func _ready():
	timer.set_wait_time(10)
	timer.set_one_shot(true)
	timer.connect("timeout",self,"_on_timer_timeout")
	add_child(timer)
	timer.start()

func _on_timer_timeout():
	get_parent().remove_child(self)