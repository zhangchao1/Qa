package controllers

import (
	"github.com/astaxie/beego"
)

type ControllerBase struct {
	beego.Controller
}

var Uid int64

func (this *ControllerBase) Prepare() {
	sess := this.StartSession()
	Uid := sess.Get("uid")
	if Uid == nil {
		this.Ctx.Redirect(302, "/user/login")
		return
	}
}
