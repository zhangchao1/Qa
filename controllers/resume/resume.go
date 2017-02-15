package resume

import (
	"Qa/controllers"
)

type Resume struct {
	controllers.ControllerBase
}

func (this *Resume) Add() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "resume"
}

func (this *Resume) Search() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "resume"
}
