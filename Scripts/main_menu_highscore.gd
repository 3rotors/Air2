extends RichTextLabel

var defult_text = "Highscore: "

func _process(delta: float) -> void:
	var text = str(defult_text, str(Global.highscore))
	self.text = (text)
