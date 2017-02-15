package travel

import (
	"Qa/controllers"
)

type Travel struct {
	controllers.ControllerBase
}

func (this *Travel) Add() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "travel"
}

func (this *Travel) Record() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "travel"
}
