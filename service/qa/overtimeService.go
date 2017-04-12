package qa

import (
	"Qa/models/overtime"
	"Qa/service/redisService"
	"Qa/validator"
	"fmt"
	"github.com/astaxie/beego/validation"
	"strconv"
)

type OverTimeService struct {
}

const TWO_DAY_OverTime = 2.0
const FOUR_DAY_OverTime = 4.0
const SEVEN_DAY_OverTime = 7.0

func (this *OverTimeService) Add(addOverTime overtime.OverTime) SaveResult {
	var result SaveResult
	var overtime overtime.OverTime
	var userRedis redisService.UserRedisService
	valid := validation.Validation{}
	val := validator.OverTimeSaveValidation{
		Uid:          addOverTime.Uid,
		EqualizeType: addOverTime.EqualizeType,
		IsOutside:    addOverTime.IsOutside,
		StartTime:    addOverTime.StartTime,
		EndTime:      addOverTime.EndTime,
		LongTime:     addOverTime.LongTime,
		Reason:       addOverTime.Reason,
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

		OtId, err := overtime.Add(addOverTime)
		if err != nil {
			result.ErrMsg = "系统错误"
			result.IsSuccess = false
		} else {
			userInfo := userRedis.GetUserInfo(addOverTime.Uid)
			var reviewService ReviewService
			var overTimeType int
			longtime, _ := strconv.ParseFloat(addOverTime.LongTime, 64)
			if longtime <= TWO_DAY_OverTime {
				overTimeType = 1
			} else if longtime > TWO_DAY_OverTime && longtime <= FOUR_DAY_OverTime {
				overTimeType = 2
			} else {
				overTimeType = 3
			}
			fmt.Println(userInfo.Role, userInfo.Did)
			errSaveReview := reviewService.Add(OtId, addOverTime.Uid, userInfo.Role, userInfo.Did, overTimeType, "overtime", addOverTime.Reason)
			fmt.Println(errSaveReview)
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
