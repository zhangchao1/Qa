package goods

import (
	"Qa/controllers"
)

type Goods struct {
	controllers.ControllerBase
}

func (this *Goods) Add() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "goods"
}

func (this *Goods) Record() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "goods"
}