package api

import (
	"Qa/models/goods"
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

// @router /goodsdetail/list [get]
func (this *Goods) GoodsDetailList() {
	var goodsDetail goods.GoodsDetail
	startIndex, _ := this.GetInt64("start")
	maxCounts, _ := this.GetInt64("max")
	keywords := this.GetString("keywords")
	if startIndex == 0 || maxCounts == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		result := goodsDetail.List(startIndex, maxCounts, "-Updated", keywords)
		this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "data": result}
		this.ServeJSON()
	}
}

// @router /goodsdetail/delete [get]
func (this *Goods) GoodsDetailDelete() {
	var goodsDetail goods.GoodsDetail
	id, _ := this.GetInt64("id")
	if id == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		err := goodsDetail.Delete(id)
		if err == nil {
			this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "删除成功！"}
		} else {
			this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "系统错误"}
		}
		this.ServeJSON()
	}
}
