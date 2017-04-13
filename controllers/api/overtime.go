package api

import (
	"Qa/models/overtime"
	"Qa/service/qa"
	"encoding/json"
	"strconv"
)

type OverTime struct {
	ControllerBase
}

// @router /add [post]
func (this *OverTime) Add() {
	var overTime overtime.OverTime
	json.Unmarshal(this.Ctx.Input.RequestBody, &overTime)
	overTime.Uid = this.GetUid()
	var overTimeService qa.OverTimeService
	result := overTimeService.Add(overTime)
	this.Data["json"] = result
	this.ServeJSON()
}

// @router /detail [get]
func (this *OverTime) Detail() {
	var overTime overtime.OverTime
	id, _ := this.GetInt64("id")
	if id == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		result := overTime.Detail(id)
		for _, value := range result {
			Uid, _ := value["Uid"].(string)
			leaveUid, _ := strconv.ParseInt(Uid, 14, 64)
			userinfo := this.GetUserInfoByUid(leaveUid)
			value["UserName"] = userinfo.UserName
			value["Name"] = userinfo.Name
		}
		this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "data": result}
		this.ServeJSON()
	}
}

// @router /list [get]
func (this *OverTime) List() {
	var overTime overtime.OverTime
	startIndex, _ := this.GetInt64("start")
	maxCounts, _ := this.GetInt64("max")
	status, _ := this.GetInt("status")
	if startIndex == 0 || maxCounts == 0 || status == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		uid := this.GetUid()
		result := overTime.GetOverTimeByStatus(startIndex, maxCounts, status, uid)
		this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "data": result}
		this.ServeJSON()
	}
}
