package colorlife

import (
	"Qa/controllers"
)

type Colorlife struct {
	controllers.ControllerBase
}

func (this *Colorlife) Add() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "colorlife"
}
func (this *Colorlife) Index() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "colorlife"
}
func (this *Colorlife) Detail() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "colorlife"
}

func (this *Colorlife) Edit() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "colorlife"
}

func (this *Colorlife) My() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "colorlife"
}

func (this *Colorlife) Search() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "colorlife"
}
