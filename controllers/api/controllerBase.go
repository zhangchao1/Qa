package api

import (
	"Qa/library/base"
	"Qa/service/redisService"
	"fmt"
	"github.com/astaxie/beego"
	"strings"
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
	var baseEncode base.BaseEncodePass
	if Uid == nil {
		token := this.Ctx.GetCookie("uid")
		if token == "" {
			this.Ctx.Redirect(302, "/user/login")
			return
		}
		src, _ := baseEncode.Decode([]byte(token))
		cookieInfo := strings.Split(string(src), ",")
		fmt.Println(cookieInfo[0])
	}

}
