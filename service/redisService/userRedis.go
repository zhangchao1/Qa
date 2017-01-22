package redisService

import (
	"Qa/library/nosql"
	"encoding/json"
	"fmt"
	"gopkg.in/redis.v4"
	"strconv"
)

var UserRedis *redis.Client

type UserRedisService struct {
}

type UserInfo struct {
	Uid     int64
	Name    string
	Email   string
	Age     int
	Sex     int
	Avatar  string
	Manager int
	Job     string
	Level   int
	Role    string
}

const USER_INOF_KEY = "qa:user:info"

func init() {
	UserRedis, _ = nosql.ConnetRedis("user")
	fmt.Print(UserRedis)
}

func (this *UserRedisService) SetUserInfo(uid int64, userInfo UserInfo) error {
	info, _ := json.Marshal(userInfo)
	Uid := strconv.FormatInt(uid, 10)
	_, status := UserRedis.HSet(USER_INOF_KEY, Uid, string(info)).Result()
	return status
}

func (this *UserRedisService) GetUserInfo(uid int64) UserInfo {
	Uid := strconv.FormatInt(uid, 10)
	info, err := UserRedis.HGet(USER_INOF_KEY, Uid).Result()
	if err != nil {
		return UserInfo{}
	} else {
		var userinfo UserInfo
		err := json.Unmarshal([]byte(info), &userinfo)
		fmt.Println(err)
		return userinfo
	}
}
