package controllers

import (
	"Qa/service/redisService"
	"fmt"
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
	fmt.Println(Uid)
	UserId := sess.Get("uid").(int64)
	var userRedis redisService.UserRedisService
	UserInfo := userRedis.GetUserInfo(UserId)
	fmt.Println(UserInfo)
	this.Data["useravatar"] = UserInfo.Avatar
	this.Data["userjob"] = UserInfo.Job
	this.Data["username"] = UserInfo.UserName
}
