extends Node2D

const GROUND_Y: float = 380.0
const AIR_Y: float = 25.0
const FLYING_Y: float = -125.0

export(Array, PackedScene) var health_items
export(Array, PackedScene) var ground_enemies
export(Array, PackedScene) var air_enemies

func _ready():
	randomize()

# Objects that heal the player
func SpawnHealth(speed):
	var i = randi() % health_items.size()
	var health = health_items[i].instance()
	health.initialize(GROUND_Y, speed)
	
	get_parent().add_child(health)

# Large spawn enemy function
func SpawnEnemy(speed):
	var enemyType = randi() % 3
	match enemyType:
		0:
			SpawnGroundEnemy(speed)
		1:
			SpawnAirEnemy(speed)
		2:
			SpawnFlyingEnemy(speed)

# Enemies that need to jump to avoid
func SpawnGroundEnemy(speed):
	var i = randi() % ground_enemies.size()
	var enemy = ground_enemies[i].instance()
	enemy.initialize(GROUND_Y, speed)
	
	get_parent().add_child(enemy)


# Enemies that need to slide to avoid
func SpawnAirEnemy(speed):
	var i = randi() % air_enemies.size()
	var enemy = air_enemies[i].instance()
	enemy.initialize(AIR_Y, speed)
	
	get_parent().add_child(enemy)
	

# Enemies that collide if player jumps
func SpawnFlyingEnemy(speed):
	var i = randi() % air_enemies.size()
	var enemy = air_enemies[i].instance()
	enemy.initialize(FLYING_Y, speed)
	
	get_parent().add_child(enemy)
