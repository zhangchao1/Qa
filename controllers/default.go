package controllers

type MainController struct {
	ControllerBase
}

func (this *MainController) Get() {
	this.Data["vueVersion"] = 2
	this.Data["controllerName"] = "home"
	this.TplName = "index.tpl"
}
