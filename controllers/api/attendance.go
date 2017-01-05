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
