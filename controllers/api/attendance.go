package api

import (
	"Qa/service/qa"
	"fmt"
	"math"
	"time"
)

type Attendance struct {
	ControllerBase
}

type MonthAttnendance struct {
	MonthSumAttendance map[string]interface{}
	IsSuccess          bool
	ErrMsg             string
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
		Uid := this.GetUid()
		result := attendanceService.AddAttendance(addTime, Uid, Ip)
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
		Uid := this.GetUid()
		datas := attendanceService.SearchAttendance(Uid, startTime, endTime, 10, startIndex)
		this.Data["json"] = datas
		this.ServeJSON()
	}
}

// @router /monthsum [get]
func (this *Attendance) MonthSum() {
	Uid := this.GetUid()
	this.Data["json"] = MonthSumAttendanceTotal(Uid)
	this.ServeJSON()
}

func MonthSumAttendanceTotal(uid int64) MonthAttnendance {
	var result MonthAttnendance
	var attendanceService qa.AttendanceService
	var monthSumHour float64
	var normalAttendance int
	var unNormalAttendance int
	var lateAttendance int
	var lateAndLeftEarly int
	var overTime int
	var leftEarly int
	monthSumHour = 0
	normalAttendance = 0
	unNormalAttendance = 0
	lateAttendance = 0
	lateAndLeftEarly = 0
	overTime = 0
	leftEarly = 0
	now := time.Now()
	startMonth := time.Date(now.Year(), now.Month(), 1, 0, 0, 0, 0, now.Location())
	endMonth := startMonth.AddDate(0, 1, -1)
	start := startMonth.Format("2006-01-02")
	end := endMonth.Format("2006-01-02")
	fmt.Println(start, end)
	result.ErrMsg = ""
	result.IsSuccess = true
	monthSumData := make(map[string]interface{})
	monthSum := attendanceService.SearchAttendance(uid, start, end, 60, 0)
	monthSumData["monthSum"] = len(monthSum.Data)
	for i := 0; i < len(monthSum.Data); i++ {
		monthSumHour += monthSum.Data[i]["GetHour"].(float64)
		if monthSum.Data[i]["Types"].(string) == "考勤异常" {
			unNormalAttendance += 1
		}
		if monthSum.Data[i]["Types"].(string) == "正常" {
			normalAttendance += 1
		}
		if monthSum.Data[i]["Types"].(string) == "加班" {
			overTime += 1
		}
		if monthSum.Data[i]["Types"].(string) == "迟到" {
			lateAttendance += 1
		}
		if monthSum.Data[i]["Types"].(string) == "早退" {
			leftEarly += 1
		}
		if monthSum.Data[i]["Types"].(string) == "迟到又早退" {
			lateAndLeftEarly += 1
		}
	}
	monthSumData["monthSumWork"] = math.Ceil(monthSumHour)
	monthSumData["unNormalAttendance"] = unNormalAttendance
	monthSumData["normalAttendance"] = normalAttendance
	monthSumData["overTime"] = overTime
	monthSumData["lateAttendance"] = lateAttendance
	monthSumData["leftEarly"] = leftEarly
	monthSumData["lateAndLeftEarly"] = lateAndLeftEarly
	result.MonthSumAttendance = monthSumData
	return result
}
