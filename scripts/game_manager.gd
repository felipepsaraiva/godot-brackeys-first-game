extends Node

var score: int = 0

func add_point():
    score += 1
    $ScoreLabel.text = 'You collected ' + str(score) + ' coins.'
