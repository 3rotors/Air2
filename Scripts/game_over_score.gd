extends RichTextLabel


var defult_text = "score: "

func _process(delta: float) -> void:
	var text = str(defult_text, str(Global.score))
	self.text = (text)
