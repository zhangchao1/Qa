package api

import (
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
