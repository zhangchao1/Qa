package controllers

type MainController struct {
	ControllerBase
}

func (this *MainController) Get() {
	this.Data["controllerName"] = "home"
	this.TplName = "index.tpl"
}
