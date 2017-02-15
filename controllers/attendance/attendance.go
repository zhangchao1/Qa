package attendance

import (
	"Qa/controllers"
)

type Attendance struct {
	controllers.ControllerBase
}

func (this *Attendance) My() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "attendance"
}

func (this *Attendance) Record() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "attendance"
}
