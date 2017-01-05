package qa

import (
	"Qa/models/attendance"
	"Qa/service/redisService"
	"fmt"
	"time"
)

const SUM_ATTENDANCE = 10
const WORK_ON_TIME = " 9:30:00"
const WORK_OFF_TIME = " 18:30:00"
const WORK_OVER_TIME = " 19:30:00"

type AttendanceService struct {
}

func (this *AttendanceService) AddAttendance(addTime string, uid int64, ip string) SaveResult {
	var result SaveResult
	var addAttendance attendance.Attendance
	var addItem attendance.Attendance
	var attendanceRedis redisService.AttendanceRedisService
	dayTime := time.Now().Format("2006-01-02")
	fmt.Println(dayTime)
	startTime := dayTime + " 00:00:00"
	endTime := dayTime + " 23:59:59"
	fmt.Println(dayTime, startTime, endTime)
	attendanceTime, _ := time.Parse("2006-01-02 15:04:05", addTime)
	dayStart, _ := time.Parse("2006-01-02 15:04:05", startTime)
	dayEnd, _ := time.Parse("2006-01-02 15:04:05", endTime)
	fmt.Println(attendanceTime, dayStart, dayEnd)
	fmt.Println(attendanceTime.After(dayEnd), attendanceTime.Before(dayStart))
	if attendanceTime.After(dayEnd) || attendanceTime.Before(dayStart) {
		result.IsSuccess = false
		result.ErrMsg = "考勤日期有误"
	} else {
		sumAttendance := attendanceRedis.GetAttendance(uid)
		if sumAttendance > SUM_ATTENDANCE {
			result.IsSuccess = false
			result.ErrMsg = "考勤次数超过上限"
		} else {
			if sumAttendance < 2 {
				addItem.Status = GetAttendanceStatus(attendanceTime)
				addItem.Uid = uid
				addItem.Ip = ip
				addItem.Created = addTime
				attendanceRedis.AddAttendance(uid)
				_, errAdd := addAttendance.AddAttendance(addItem)
				if errAdd == nil {
					result.IsSuccess = true
					result.ErrMsg = "考勤成功"
				} else {
					result.IsSuccess = false
					result.ErrMsg = "系统错误"
				}
			} else {
				attendaceInfo := addAttendance.GetUserDayAttendanceInfo(uid, startTime,
					endTime)
				status := GetAttendanceStatus(attendanceTime)
				updateId, ok := attendaceInfo[1]["Id"].(int64)
				attendanceRedis.AddAttendance(uid)
				if !ok {
					result.IsSuccess = false
					result.ErrMsg = "类型错误"
				}
				errUpdate := addAttendance.UpdateAttendance(updateId, addTime, status,
					ip)
				if errUpdate == nil {
					result.IsSuccess = true
					result.ErrMsg = "考勤成功"
				} else {
					result.IsSuccess = false
					result.ErrMsg = "系统错误"
				}
			}
		}
	}
	return result
}

func GetAttendanceStatus(attendanceTime time.Time) int {
	dayTime := time.Now().Format("2006-01-02")
	workOnTime := dayTime + WORK_ON_TIME
	workOffTime := dayTime + WORK_OFF_TIME
	workOverTime := dayTime + WORK_OVER_TIME
	workMiddleTime := dayTime + " 12:00:00"
	onTime, _ := time.Parse("2006-01-02 15:04:05", workOnTime)
	offTime, _ := time.Parse("2006-01-02 15:04:05", workOffTime)
	overTime, _ := time.Parse("2006-01-02 15:04:05", workOverTime)
	middleTime, _ := time.Parse("2006-01-02 15:04:05", workMiddleTime)
	var status int
	if onTime.Before(attendanceTime) {
		status = 1
	}
	if onTime.After(attendanceTime) && middleTime.Before(attendanceTime) {
		status = 2
	}
	if middleTime.After(attendanceTime) && offTime.Before(attendanceTime) {
		status = 3
	}
	if offTime.After(attendanceTime) && overTime.Before(attendanceTime) {
		status = 4
	}
	if overTime.After(attendanceTime) {
		status = 5
	}
	return status
}
