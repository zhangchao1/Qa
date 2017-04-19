package goods

import (
	"Qa/controllers"
	"strconv"
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

func (this *Goods) Manage() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "goods"
}

func (this *Goods) GoodsDetailAdd() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "goods"
}

func (this *Goods) GoodsDetailEdit() {
	var id int64
	Params := make(map[string]string)
	Params = this.Ctx.Input.Params()
	id, _ = strconv.ParseInt(Params["0"], 10, 64)
	if id == 0 {
		return
	} else {
		this.Data["goodsDeatilId"] = id
		this.Data["vueVersion"] = 1
		this.Data["controllerName"] = "goods"
	}
}
