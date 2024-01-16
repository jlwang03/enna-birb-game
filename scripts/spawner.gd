extends Node2D

const GROUND_Y: float = 380.0
const AIR_Y: float = 25.0
const FLYING_Y: float = -125.0
const BEAM_Y_LOW: float = -215.0
const BEAM_Y_HIGH: float = -400.0

export(Array, PackedScene) var health_items
export(Array, PackedScene) var ground_enemies
export(Array, PackedScene) var ground_obstacles
export(Array, PackedScene) var air_enemies
export(PackedScene) var air_beam


func _ready():
	randomize()


# Objects that heal the player
func SpawnHealth(speed, enemy_y):
	var i = randi() % health_items.size()
	var health = health_items[i].instance()
	
	var health_y = GROUND_Y
	if enemy_y == GROUND_Y:
		health_y = AIR_Y
	health.initialize(health_y, speed)
	
	add_child(health)


# Large spawn enemy function
func SpawnEnemy(speed):
	var enemyType = randi() % 5
	match enemyType:
		0:
			return SpawnGroundEnemy(speed)
		1:
			return SpawnGroundObstacles(speed)
		2:
			return SpawnAirEnemy(speed)
		3:
			return SpawnFlyingEnemy(speed)
		4:
			return SpawnBeam(speed)

# Enemies that need to jump to avoid
func SpawnGroundEnemy(speed):
	var i = randi() % ground_enemies.size()
	var enemy = ground_enemies[i].instance()
	enemy.initialize(GROUND_Y, speed)
	
	add_child(enemy)
	return GROUND_Y


# Obstacles that need to jump to avoid
func SpawnGroundObstacles(speed):
	var i = randi() % ground_obstacles.size()
	var enemy = ground_obstacles[i].instance()
	enemy.initialize(GROUND_Y, speed)
	
	add_child(enemy)
	return GROUND_Y


# Enemies that need to slide to avoid
func SpawnAirEnemy(speed):
	var i = randi() % air_enemies.size()
	var enemy = air_enemies[i].instance()
	enemy.initialize(AIR_Y, speed)
	
	add_child(enemy)
	return AIR_Y
	

# Enemies that collide if player jumps
func SpawnFlyingEnemy(speed):
	var i = randi() % air_enemies.size()
	var enemy = air_enemies[i].instance()
	enemy.initialize(FLYING_Y, speed)
	
	add_child(enemy)
	return FLYING_Y


# Generates floating beam
func SpawnBeam(speed):
	var enemy = air_beam.instance()
	enemy.initialize(rand_range(BEAM_Y_HIGH, BEAM_Y_LOW), speed)
	
	add_child(enemy)
	return BEAM_Y_HIGH
