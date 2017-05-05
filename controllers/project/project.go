package project

import (
	"Qa/controllers"
)

type Project struct {
	controllers.ControllerBase
}

func (this *Project) Add() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "project"
}

func (this *Project) My() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "project"
}

func (this *Project) Edit() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "project"
}

func (this *Project) Record() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "project"
}
