extends KinematicBody2D
var velocidade = Vector2.ZERO
var numeroDeVidas = 0 
var pontos = 0
var posicaox
var posicaoy

func _physics_process(delta):

	move_and_slide(velocidade*10)
	get_input()
	$".".get_parent().get_node("HUD/Label").set_text ("Número de Vidas: "+str(numeroDeVidas))
	$".".get_parent().get_node("HUD/pontos").set_text ("Pontos: "+str(pontos))
	pass
	
func _ready():
	velocidade.x = 100
	numeroDeVidas = 20
	pontos = 0
	pass 

func _on_esquerda_body_entered(body):
	velocidade.x *= -1 
	velocidade.y -= randi() % 20
	numeroDeVidas -= 1
	game_over(numeroDeVidas)

func on_RetanguloEsquerdo_entered(body):
	pontos+=1
	pass

func _on_direita_body_entered(body):
	velocidade.x *= -1 
	velocidade.y -= randi() % 20
	numeroDeVidas -= 1
	game_over(numeroDeVidas)
	pass # Replace with function body.
	
func on_RetanguloDireita_entered(body):
	pontos+=1
	pass

func _on_cima_body_entered(body):
	velocidade.y *= -1 
	velocidade.x -= randi() % 20
	numeroDeVidas -= 1
	game_over(numeroDeVidas)
	
func on_Retangulo_entered(body):
	pontos+=1
	pass

func _on_baixo_body_entered(body):
	velocidade.y *= -1 
	velocidade.x -= randi() % 20
	numeroDeVidas -= 1
	print($".".position.y)
	game_over(numeroDeVidas)
	
func on_RetanguloBaixo_entered(body):
	pontos+=1
	pass

func game_over(numeroDeVidas):
	if numeroDeVidas <= 0:
		$".".get_parent().get_node("HUD/gameOver").set_text ("GAME OVER")
		$".".queue_free()

func get_input():
	if Input.is_action_just_pressed("ui_right"):
		posicaox = $".".position.x
		if posicaox > 49.333241 && posicaox < 49.333241 + 80:
			pontos += 1 
		velocidade.x *= -1 
		velocidade.y -= randi() % 5

	if Input.is_action_just_pressed("ui_left"):
		posicaox = $".".position.x
		if posicaox < 1871.833252 && posicaox > 1871.833252 - 80:
			pontos += 1 
		velocidade.x *= -1 
		velocidade.y -= randi() % 5

	if Input.is_action_just_pressed("ui_up"):
		posicaoy = $".".position.y
		if posicaoy < 1013.668518 && posicaoy > 1013.668518 +- 80:
			pontos += 1 
		velocidade.y *= -1 
		velocidade.x -= randi() % 50

	if Input.is_action_just_pressed("ui_down"):
		posicaoy = $".".position.y
		if posicaoy > 64.500046 && posicaoy < 64.500046 + 80:
			pontos += 1 
		velocidade.y *= -1 
		velocidade.x -= randi() % 50
