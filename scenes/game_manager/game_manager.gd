extends Node2D


# Bola
@onready var bola : Area2D = $"../Bola"

# Pontuações
var pontuacao_jogador1 : int = 0
var pontuacao_jogador2 : int = 0

# UI
@onready var texto_pontuacao_jogador1 : Label = $"../UI/PainelDePontuacao/TextoPontuacaoJogador1"
@onready var texto_pontuacao_jogador2 : Label = $"../UI/PainelDePontuacao/TextoPontucaoJogador2"

# Efeitos sonoros
@onready var som_impacto_gol : AudioStreamPlayer = $SomImpactoGol


func _ready():
	pass


func _process(delta):
	receber_inputs()


func receber_inputs() -> void:
	if Input.is_action_just_pressed("reiniciar"):
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("sair"):
		get_tree().quit()


func _on_gol_1_area_entered(area):
	som_impacto_gol.play()
	pontuacao_jogador2 += 1
	texto_pontuacao_jogador2.text = str(pontuacao_jogador2)
	bola.rodar_timer()


func _on_gol_2_area_entered(area):
	som_impacto_gol.play()
	pontuacao_jogador1 += 1
	texto_pontuacao_jogador1.text = str(pontuacao_jogador1)
	bola.rodar_timer()
