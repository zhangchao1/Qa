package article

import (
	"Qa/controllers"
	"strconv"
)

type Article struct {
	controllers.ControllerBase
}

func (this *Article) Index() {
	this.Data["controllerName"] = "article"
}

func (this *Article) Edit() {
	var id int64
	Params := make(map[string]string)
	Params = this.Ctx.Input.Params()
	id, _ = strconv.ParseInt(Params["0"], 10, 64)
	if id == 0 {
		return
	} else {
		this.Data["controllerName"] = "article"
	}
}

func (this *Article) Detail() {
	var id int64
	Params := make(map[string]string)
	Params = this.Ctx.Input.Params()
	id, _ = strconv.ParseInt(Params["0"], 10, 64)
	if id == 0 {
		return
	} else {
		this.Data["controllerName"] = "article"
	}
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
