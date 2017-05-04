package colorlife

import (
	"Qa/controllers"
	"Qa/service/redisService"
	"strconv"
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
	var id int64
	Params := make(map[string]string)
	Params = this.Ctx.Input.Params()
	id, _ = strconv.ParseInt(Params["0"], 10, 64)
	if id == 0 {
		return
	} else {
		this.Data["cid"] = id
		this.Data["uid"] = this.GetUid()
		var userRedis redisService.UserRedisService
		UserInfo := userRedis.GetUserInfo(this.GetUid())
		this.Data["useravatar"] = UserInfo.Avatar
		this.Data["username"] = UserInfo.UserName
		this.Data["vueVersion"] = 1
		this.Data["controllerName"] = "colorlife"
	}
}

func (this *Colorlife) Edit() {
	var id int64
	Params := make(map[string]string)
	Params = this.Ctx.Input.Params()
	id, _ = strconv.ParseInt(Params["0"], 10, 64)
	if id == 0 {
		return
	} else {
		this.Data["cid"] = id
		this.Data["vueVersion"] = 1
		this.Data["controllerName"] = "colorlife"
	}
}

func (this *Colorlife) My() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "colorlife"
}

func (this *Colorlife) Search() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "colorlife"
}
