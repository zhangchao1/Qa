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
	var id int64
	Params := make(map[string]string)
	Params = this.Ctx.Input.Params()
	id, _ = strconv.ParseInt(Params["0"], 10, 64)
	if id == 0 {
		return
	} else {
		this.Data["controllerName"] = "admin"
		this.Data["vueVersion"] = 1
	}
}

func (this *Admin) EditAccount() {
	var id int64
	Params := make(map[string]string)
	Params = this.Ctx.Input.Params()
	id, _ = strconv.ParseInt(Params["0"], 10, 64)
	if id == 0 {
		return
	} else {
		this.Data["uid"] = uid
		this.Data["controllerName"] = "admin"
		this.Data["vueVersion"] = 1
	}
}
