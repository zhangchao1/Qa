package qa

import (
	"Qa/models/leave"
	"Qa/service/redisService"
	"Qa/validator"
	"fmt"
	"github.com/astaxie/beego/validation"
)

type LeaveService struct {
}

func (this *LeaveService) Add(addLeave leave.Leave) SaveResult {
	var result SaveResult
	var leave leave.Leave
	var userRedis redisService.UserRedisService
	valid := validation.Validation{}
	val := validator.LeaveSaveValidation{
		Uid:       addLeave.Uid,
		Type:      addLeave.Type,
		StartTime: addLeave.StartTime,
		EndTime:   addLeave.EndTime,
		Reason:    addLeave.Reason,
		LongTime:  addLeave.LongTime,
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
		leaveId, err := leave.Add(addLeave)
		if err != nil {
			result.ErrMsg = "系统错误"
			result.IsSuccess = false
		} else {
			userInfo := userRedis.GetUserInfo(addLeave.Uid)
			var reviewService ReviewService
			errSaveReview := reviewService.Add(leaveId, addLeave.Uid, userInfo.Role, userInfo.Did, 1, "leave", addLeave.Reason)
			if errSaveReview != nil {
				result.ErrMsg = "系统错误"
				result.IsSuccess = false
			} else {
				result.ErrMsg = "申请成功！"
				result.IsSuccess = true
			}
		}
	}
	return result
}
