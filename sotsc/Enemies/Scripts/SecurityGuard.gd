extends CharacterBody3D


enum States{
	patrol,
	chasing,
	hunting,
	waiting
}

var currentState : States
@onready var navigationAgent : NavigationAgent3D
@onready var waypoints = get_tree().get_nodes_in_group("EnemyWaypoint")
var waypointIndex : int
@export var speed = 2


func _ready():
	currentState = States.patrol
	navigationAgent = $NavigationAgent3D
	navigationAgent.set_target_position(waypoints[0].global_position)
	pass

func _physics_process(delta):
	match currentState:
		States.patrol:
			if(navigationAgent.is_navigation_finished()):
				return
			var targetPos = navigationAgent.get_next_path_position()
			var direction = global_position.direction_to(targetPos)
			velocity = direction * speed
			move_and_slide()
			pass
		States.chasing:
			pass
		States.hunting:
			pass
		States.waiting:
			pass
	pass
