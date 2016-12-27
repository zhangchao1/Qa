package api

type Article struct {
	ControllerBase
}

// @router /add
func (this *Article) Add() {
	this.Data["json"] = 123
	this.ServeJSON()
}
