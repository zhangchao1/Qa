package article

import (
	"Qa/controllers"
)

type Article struct {
	controllers.ControllerBase
}

func (this *Article) Index() {
	this.Data["controllerName"] = "article"
}

func (this *Article) Edit() {
	this.Data["controllerName"] = "article"
}

func (this *Article) Detail() {
	this.Data["controllerName"] = "article"
}

func (this *Article) Add() {
	this.Data["controllerName"] = "article"
}

func (this *Article) My() {
	this.Data["controllerName"] = "article"
}

func (this *Article) Recycle() {
	this.Data["controllerName"] = "article"
}
