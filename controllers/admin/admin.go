package admin

import (
	"Qa/controllers"
)

type Admin struct {
	controllers.ControllerBase
}

func (this *Admin) CreatAccount() {
	this.Data["controllerName"] = "admin"
	this.Data["vueVersion"] = 1
}

func (this *Admin) UpdatePassword() {
	this.Data["controllerName"] = "admin"
	this.Data["vueVersion"] = 1
}
