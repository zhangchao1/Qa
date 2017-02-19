package qa

import (
	"Qa/models/user"
	"Qa/service/redisService"
)

type UserService struct {
}

func (this *UserService) EditUserAvatar(uid int64, avatar string) SaveResult {
	var EditUser user.User
	var result SaveResult
	var userRedis redisService.UserRedisService
	UserInfo := userRedis.GetUserInfo(uid)
	UserInfo.Avatar = avatar
	errEdit := EditUser.EditAvatar(uid, avatar)
	errSaveRedis := userRedis.SetUserInfo(uid, UserInfo)
	if errEdit != nil || errSaveRedis != nil {
		result.IsSuccess = false
		result.ErrMsg = "系统错误"
	}
	result.IsSuccess = true
	result.ErrMsg = "保存成功"
	return result
}
