package api

import (
	"Qa/models/user"
)

type Goods struct {
	ControllerBase
}

// @router /approvalusers [get]
func (this *Goods) GoodApproval() {
	var approveUser user.User
	result := approveUser.GetUserByDid(16)
	this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "Data": result}
	this.ServeJSON()
}
