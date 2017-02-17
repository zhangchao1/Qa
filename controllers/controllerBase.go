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
	this.Data["userage"] = UserInfo.Age
	sex := UserInfo.Sex
	this.Data["usersex"] = "男"
	if sex == 2 {
		this.Data["usersex"] = "女"
	}
}

func (this *ControllerBase) GetUid() int64 {
	sess := this.StartSession()
	Uid := sess.Get("uid")
	var baseEncode base.BaseEncodePass
	if Uid == nil {
		token := this.Ctx.GetCookie("uid")
		src, _ := baseEncode.Decode([]byte(token))
		cookieInfo := strings.Split(string(src), ",")
		uid, _ := strconv.ParseInt(cookieInfo[0], 10, 64)
		return uid
	}
	return Uid.(int64)
}
func (this *ControllerBase) GetUserInfo() redisService.UserInfo {
	sess := this.StartSession()
	Uid := sess.Get("uid")
	var baseEncode base.BaseEncodePass
	var userid int64
	var userRedis redisService.UserRedisService
	if Uid == nil {
		token := this.Ctx.GetCookie("uid")
		src, _ := baseEncode.Decode([]byte(token))
		cookieInfo := strings.Split(string(src), ",")
		uid, _ := strconv.ParseInt(cookieInfo[0], 10, 64)
		userid = uid
	} else {
		userid = Uid.(int64)
	}
	userInfo := userRedis.GetUserInfo(userid)
	return userInfo
}
