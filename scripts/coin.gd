extends Area2D




func _on_body_entered(_body: Node2D) -> void:
    %GameManager.add_point()
    $AnimationPlayer.play("pickup")
