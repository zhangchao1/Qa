package api

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
