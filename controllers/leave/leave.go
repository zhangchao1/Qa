package leave

import (
	"Qa/controllers"
)

type Leave struct {
	controllers.ControllerBase
}

func (this *Leave) My() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "leave"
}

func (this *Leave) Record() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "leave"
}
