package redisService

import (
	"Qa/library/nosql"
	"fmt"
	"gopkg.in/redis.v4"
	"strconv"
	"time"
)

const USER_EACH_DAY_ATTENDANCE = "qa:user:attendance:%s:%d"

var attendanceRedis *redis.Client

type AttendanceRedisService struct {
}

func init() {
	attendanceRedis, _ = nosql.ConnetRedis("user")
	fmt.Print(attendanceRedis)
}

func (this *AttendanceRedisService) AddAttendance(uid int64) int64 {
	dayTime := time.Now().Format("20060102")
	attendanceKey := fmt.Sprintf(USER_EACH_DAY_ATTENDANCE, dayTime, uid)
	fmt.Println(attendanceKey)
	Uid := strconv.FormatInt(uid, 10)
	count, _ := attendanceRedis.HIncrBy(attendanceKey, Uid, 1).Result()
	return count
}

func (this *AttendanceRedisService) GetAttendance(uid int64) int64 {
	dayTime := time.Now().Format("20060102")
	attendanceKey := fmt.Sprintf(USER_EACH_DAY_ATTENDANCE, dayTime, uid)
	fmt.Println(attendanceKey)
	Uid := strconv.FormatInt(uid, 10)
	result, _ := attendanceRedis.HGet(attendanceKey, Uid).Result()
	count, _ := strconv.ParseInt(result, 10, 64)
	return count
}
