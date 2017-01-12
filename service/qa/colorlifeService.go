package qa

import (
	"Qa/models/colorlife"
	"Qa/validator"
	"fmt"
	"github.com/astaxie/beego/validation"
)

type ColorlifeService struct {
}

func (this *ColorlifeService) Add(addColorlife colorlife.Colorlife) SaveResult {
	var result SaveResult
	var colorlife colorlife.Colorlife
	valid := validation.Validation{}
	val := validator.ColorlifeSaveValidation{
		Uid:         addColorlife.Uid,
		Title:       addColorlife.Title,
		Description: addColorlife.Description,
		Tag:         addColorlife.Tag,
		IsPublic:    addColorlife.IsPublic,
		Ablums:      addColorlife.Ablums,
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
		_, err := colorlife.AddColorlife(addColorlife)
		fmt.Println(err)
		if err != nil {
			result.ErrMsg = "系统错误"
			result.IsSuccess = false
		} else {
			result.ErrMsg = "保存成功"
			result.IsSuccess = true
		}
	}
	return result
}
