package api

import (
	"Qa/service/qa"
)

type Attendance struct {
	ControllerBase
}

// @router /add [get]
func (this *Attendance) Add() {
	var attendanceService qa.AttendanceService
	addTime := this.GetString("addTime")
	if addTime == "" {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		Ip := this.Ctx.Input.IP()
		result := attendanceService.AddAttendance(addTime, 1, Ip)
		this.Data["json"] = result
		this.ServeJSON()
	}
}

// @router /search [get]
func (this *Attendance) Search() {
	var attendanceService qa.AttendanceService
	startTime := this.GetString("startTime")
	endTime := this.GetString("endTime")
	startIndex, _ := this.GetInt64("startIndex")
	if startTime == "" || endTime == "" || startIndex == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		startIndex = startIndex - 1
		datas := attendanceService.SearchAttendance(1, startTime, endTime, 10, startIndex)
		this.Data["json"] = datas
		this.ServeJSON()
	}
}
