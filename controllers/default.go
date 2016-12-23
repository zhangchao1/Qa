package controllers

type MainController struct {
	ControllerBase
}

func (this *MainController) Get() {
	this.TplName = "index.tpl"
}
