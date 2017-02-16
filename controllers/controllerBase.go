package controllers

import (
	"Qa/library/base"
	"Qa/service/redisService"
	"fmt"
	"github.com/astaxie/beego"
	"strconv"
	"strings"
)

type ControllerBase struct {
	beego.Controller
}

var Uid int64

func (this *ControllerBase) Prepare() {
	sess := this.StartSession()
	var baseEncode base.BaseEncodePass
	var UserId int64
	Uid := sess.Get("uid")
	if Uid == nil {
		token := this.Ctx.GetCookie("uid")
		if token == "" {
			this.Ctx.Redirect(302, "/user/login")
			return
		}
		src, _ := baseEncode.Decode([]byte(token))
		cookieInfo := strings.Split(string(src), ",")
		UserId, _ = strconv.ParseInt(cookieInfo[0], 10, 64)
	} else {
		UserId = sess.Get("uid").(int64)
	}
	var userRedis redisService.UserRedisService
	UserInfo := userRedis.GetUserInfo(UserId)
	fmt.Println(UserInfo)
	this.Data["useravatar"] = UserInfo.Avatar
	this.Data["userjob"] = UserInfo.Job
	this.Data["username"] = UserInfo.UserName
}
