package admin

import (
	"Qa/controllers"
	"strconv"
)

type Admin struct {
	controllers.ControllerBase
}

func (this *Admin) CreatAccount() {
	this.Data["controllerName"] = "admin"
	this.Data["vueVersion"] = 1
}

func (this *Admin) UpdatePassword() {
	var uid int64
	Params := make(map[string]string)
	Params = this.Ctx.Input.Params()
	uid, _ = strconv.ParseInt(Params["0"], 10, 64)
	if uid == 0 {
		return
	} else {
		this.Data["controllerName"] = "admin"
		this.Data["vueVersion"] = 1
		this.Data["uid"] = uid
	}
}

func (this *Admin) EditAccount() {
	var uid int64
	Params := make(map[string]string)
	Params = this.Ctx.Input.Params()
	uid, _ = strconv.ParseInt(Params["0"], 10, 64)
	if uid == 0 {
		return
	} else {
		this.Data["uid"] = uid
		this.Data["controllerName"] = "admin"
		this.Data["vueVersion"] = 1
	}
}

func (this *Admin) UserList() {
	this.Data["controllerName"] = "admin"
	this.Data["vueVersion"] = 1
}
