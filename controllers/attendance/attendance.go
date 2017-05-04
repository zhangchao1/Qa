package attendance

import (
	"Qa/controllers"
	"Qa/service/redisService"
)

type Attendance struct {
	controllers.ControllerBase
}

func (this *Attendance) My() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "attendance"
	this.Data["uid"] = this.GetUid()
	var userRedis redisService.UserRedisService
	UserInfo := userRedis.GetUserInfo(this.GetUid())
	this.Data["useravatar"] = UserInfo.Avatar
	this.Data["username"] = UserInfo.UserName
}

func (this *Attendance) Record() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "attendance"
}
