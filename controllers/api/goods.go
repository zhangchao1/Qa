package api

import (
	"Qa/models/goods"
	"Qa/models/user"
	"Qa/service/qa"
	"encoding/json"
	"fmt"
)

type Goods struct {
	ControllerBase
}

type AddGoods struct {
	GoodsDetailId   int64
	Application     string
	ApplyTotalCount int
}

// @router /approvalusers [get]
func (this *Goods) GoodApproval() {
	var approveUser user.User
	result := approveUser.GetUserByDid(16)
	this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "Data": result}
	this.ServeJSON()
}

// @router /add [post]
func (this *Goods) Add() {
	var addGoods AddGoods
	json.Unmarshal(this.Ctx.Input.RequestBody, &addGoods)
	var additem goods.Goods
	additem.Uid = this.GetUid()
	additem.Application = addGoods.Application
	additem.GoodsDetailId = addGoods.GoodsDetailId
	additem.ApplyTotalCount = addGoods.ApplyTotalCount
	var goodsService qa.GoodsService
	result := goodsService.Add(additem)
	this.Data["json"] = result
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

// @router /goodsdetail/add [post]
func (this *Goods) GoodsDetailAdd() {
	var goodsDetail goods.GoodsDetail
	json.Unmarshal(this.Ctx.Input.RequestBody, &goodsDetail)
	var goodsService qa.GoodsService
	result := goodsService.AddGoodsDetail(goodsDetail)
	this.Data["json"] = result
	this.ServeJSON()
}

// @router /goodsdetail/info [get]
func (this *Goods) GoodsDetailInfo() {
	id, _ := this.GetInt64("id")
	var goodsDetail goods.GoodsDetail
	if id == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		result := goodsDetail.Info(id)
		this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "Data": result}
		this.ServeJSON()
	}
}

// @router /goodsdetail/edit [post]
func (this *Goods) GoodsDetailEdit() {
	var goodsDetail goods.GoodsDetail
	json.Unmarshal(this.Ctx.Input.RequestBody, &goodsDetail)
	var goodsDetailEdit goods.GoodsDetail
	err := goodsDetailEdit.Edit(goodsDetail)
	fmt.Println(err)
	if err == nil {
		this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "保存成功！"}
	} else {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "系统错误！"}
	}
	this.ServeJSON()
}

// @router /goodsdetail/all [get]
func (this *Goods) GoodsDetailAll() {
	var goodsDetail goods.GoodsDetail
	items := goodsDetail.All("-Updated")
	this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "Data": items}
	this.ServeJSON()
}
