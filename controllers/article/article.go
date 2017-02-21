package article

import (
	"Qa/controllers"
	"strconv"
)

type Article struct {
	controllers.ControllerBase
}

func (this *Article) Index() {
	this.Data["vueVersion"] = 2
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
		this.Data["aid"] = id
		this.Data["vueVersion"] = 1
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
		this.Data["aid"] = id
		this.Data["uid"] = this.GetUid()
		this.Data["vueVersion"] = 1
		this.Data["controllerName"] = "article"
	}
}

func (this *Article) Add() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "article"
}

func (this *Article) My() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "article"
}

func (this *Article) Recycle() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "article"
}
