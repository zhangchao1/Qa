package qa

import (
	"Qa/models/user"
	"Qa/service/redisService"
	"Qa/validator"
	"fmt"
	"github.com/astaxie/beego/validation"
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

func (this *UserService) EditUserDetail(uid int64, item user.UserDetail) SaveResult {
	var result SaveResult
	var userDetail user.UserDetail
	valid := validation.Validation{}
	val := validator.UserDetailEditValidation{
		Habit:    item.Habit,
		Motto:    item.Motto,
		Eduction: item.Eduction,
		Location: item.Location,
		PhoneNum: item.PhoneNum,
		Birthday: item.Birthday,
	}
	is, err := valid.Valid(&val)
	if err != nil {
		result.ErrMsg = "传入正确的参数"
		result.IsSuccess = false
	} else if !is {
		for _, err := range valid.Errors {
			result.ErrMsg = fmt.Sprintf("%s:%s", err.Key, err.Message)
		}
		result.IsSuccess = false
	} else {
		_, errSerach := userDetail.GetUserDetailByUid(uid)
		fmt.Println(errSerach, 2)
		if errSerach != nil {
			_, errsave := userDetail.AddUserDetail(item)
			fmt.Println(errsave, 3)
			if errsave != nil {
				result.ErrMsg = "系统错误"
				result.IsSuccess = false
			} else {
				result.ErrMsg = "保存成功"
				result.IsSuccess = true
			}
		} else {
			errUpdate := userDetail.EditUserDetail(uid, item)
			fmt.Println(errUpdate, 1)
			if errUpdate != nil {
				result.ErrMsg = "系统错误"
				result.IsSuccess = false
			} else {
				result.ErrMsg = "保存成功"
				result.IsSuccess = true
			}
		}
	}
	return result
}
