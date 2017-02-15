package overtime

import (
	"Qa/controllers"
)

type Overtime struct {
	controllers.ControllerBase
}

func (this *Overtime) Add() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "overtime"
}

func (this *Overtime) Record() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "overtime"
}
