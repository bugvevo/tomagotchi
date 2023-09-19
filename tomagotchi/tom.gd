extends Area2D

var array = [-50,0,50]
var x_adjust = array[0]
var starting_x = position.x

var change = [0,0,0,0,0,0,1,1,1,3]

var hunger = 30
var play = 30
var poop = 30

# Called when the node enters the scene tree for the first time.
func _ready():
	await get_node("../HUD").start_game
	$AnimatedSprite2D.play()
	$TomShiftTimer.start()
	$TomStatsUpdateTimer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_tom_shift_timer_timeout():
	array.shuffle()
	x_adjust = array[0]
	position.x = starting_x + x_adjust
	$TomShiftTimer.start()


func _on_tom_stats_update_timer_timeout():
	change.shuffle()
	var hunger_change = change[0]
	hunger = hunger - hunger_change
	print(hunger)
