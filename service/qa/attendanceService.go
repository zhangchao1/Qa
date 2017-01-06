package qa

import (
	"Qa/models/attendance"
	"Qa/service/redisService"
	"fmt"
	"github.com/astaxie/beego/orm"
	"strings"
	"time"
)

const SUM_ATTENDANCE = 10
const WORK_ON_TIME = " 9:30:00"
const WORK_OFF_TIME = " 18:30:00"
const WORK_OVER_TIME = " 19:30:00"

type Datas struct {
	Data      []orm.Params
	IsSuccess bool
	ErrMsg    string
}
type AttendanceService struct {
}

func (this *AttendanceService) AddAttendance(addTime string, uid int64, ip string) SaveResult {
	var result SaveResult
	var addAttendance attendance.Attendance
	var addItem attendance.Attendance
	var attendanceRedis redisService.AttendanceRedisService
	dayTime := time.Now().Format("2006-01-02")
	startTime := dayTime + " 00:00:00"
	endTime := dayTime + " 23:59:59"
	attendanceTime, _ := time.Parse("2006-01-02 15:04:05", addTime)
	dayStart, _ := time.Parse("2006-01-02 15:04:05", startTime)
	dayEnd, _ := time.Parse("2006-01-02 15:04:05", endTime)
	if attendanceTime.Before(dayStart) || attendanceTime.After(dayEnd) {
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
				fmt.Println(attendaceInfo)
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
	if onTime.After(attendanceTime) {
		status = 1
	}
	if onTime.Before(attendanceTime) && middleTime.After(attendanceTime) {
		status = 2
	}
	if middleTime.Before(attendanceTime) && offTime.After(attendanceTime) {
		status = 3
	}
	if offTime.Before(attendanceTime) && overTime.After(attendanceTime) {
		status = 4
	}
	if overTime.Before(attendanceTime) {
		status = 5
	}
	return status
}

func (this *AttendanceService) SearchAttendance(uid int64, startTime string, endTime string, limit int64, offset int64) Datas {
	var serachAttendance attendance.Attendance
	var Items Datas
	searchInfo := serachAttendance.GetRangeAttendanceRecord(uid, startTime, endTime, limit, offset)
	for i := 0; i < len(searchInfo); i++ {
		oldtypes, ok := searchInfo[i]["Types"].(string)
		if !ok {
			fmt.Println("sytem error")
		}
		searchInfo[i]["Status"], searchInfo[i]["Types"] = CheckTypes(oldtypes)
	}
	Items.Data = searchInfo
	Items.ErrMsg = ""
	Items.IsSuccess = true
	return Items
}

func CheckTypes(types string) (string, string) {
	if !strings.Contains(types, ",") {
		return "label-danger", "考勤异常"
	} else {
		typesInfo := strings.Split(types, ",")
		if typesInfo[0] == "1" && typesInfo[1] == "4" {
			return "label-success", "正常"
		} else if typesInfo[0] == "1" && typesInfo[1] == "5" {
			return "label-success", "加班"
		} else if typesInfo[0] == "2" && (typesInfo[1] == "4" || typesInfo[1] == "5") {
			return "label-danger", "迟到"
		} else if typesInfo[0] == "1" && typesInfo[1] == "3" {
			return "label-danger", "早退"
		} else {
			return "label-danger", "迟到又早退"
		}
	}
}
