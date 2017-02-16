package api

import (
	"Qa/service/redisService"
	"github.com/astaxie/beego"
)

type ControllerBase struct {
	beego.Controller
}

func (this *ControllerBase) GetUid() int64 {
	sess := this.StartSession()
	Uid := sess.Get("uid").(int64)
	return Uid
}
func (this *ControllerBase) GetUserInfo() redisService.UserInfo {
	sess := this.StartSession()
	Uid := sess.Get("uid").(int64)
	var userRedis redisService.UserRedisService
	userInfo := userRedis.GetUserInfo(Uid)
	return userInfo
}
func (this *ControllerBase) Prepare() {
	sess := this.StartSession()
	Uid := sess.Get("uid")
	if Uid == nil {
		this.Ctx.Redirect(302, "/user/login")
		return
	}
}
