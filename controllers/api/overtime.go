package api

import (
	"Qa/models/overtime"
	"Qa/service/qa"
	"encoding/json"
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
