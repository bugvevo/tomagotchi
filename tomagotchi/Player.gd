extends Area2D

var screenSize

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_viewport_rect().size

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var mousePos = get_viewport().get_mouse_position()
	position.x = clamp(mousePos.x + 50, 75, screenSize.x - 75)
	position.y = clamp(max(mousePos.y, 200) + 130, 0, screenSize.y)

func _input(event):
   # Mouse in viewport coordinates.
	if event is InputEventMouseButton && $AnimatedSprite2D.frame == 0:
		$AnimatedSprite2D.frame = 1
	elif event is InputEventMouseButton && $AnimatedSprite2D.frame == 1:
		$AnimatedSprite2D.frame = 0
