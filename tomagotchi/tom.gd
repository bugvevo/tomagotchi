extends Area2D

var array = [-50,0,50]
var x_adjust = array[0]
var starting_x = position.x

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play()
	$TomShiftTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_tom_shift_timer_timeout():
	array.shuffle()
	x_adjust = array[0]
	position.x = starting_x + x_adjust
	$TomShiftTimer.start()
