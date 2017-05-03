package qa

import (
	"Qa/models/colorlife"
	"Qa/models/comment"
	"Qa/service/redisService"
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

func (this *ColorlifeService) Edit(editColorlife colorlife.Colorlife) SaveResult {
	var result SaveResult
	var colorlife colorlife.Colorlife
	valid := validation.Validation{}
	val := validator.ColorlifeEditValidation{
		Id:          editColorlife.Id,
		Title:       editColorlife.Title,
		Description: editColorlife.Description,
		Tag:         editColorlife.Tag,
		IsPublic:    editColorlife.IsPublic,
		Ablums:      editColorlife.Ablums,
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
		err := colorlife.EditColorlife(editColorlife.Id, editColorlife)
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

func (this *ColorlifeService) GetColorlifeByCid(id int64, status int) (colorlife.Colorlife, error) {
	var data colorlife.Colorlife
	var colorlife colorlife.Colorlife
	data, err := colorlife.GetColorlifeById(id, status)
	return data, err
}

func (this *ColorlifeService) AddAdmrie(id int64, Uid int64, name string) AdmireResult {
	var colorlife colorlife.Colorlife
	var admireService AdmireService
	var admireRedis redisService.AdmireRedisService
	var result AdmireResult
	errUserAdmire := admireRedis.AdmireStatusColorlife(int(id), Uid)
	_, errIdStatus := colorlife.GetColorlifeById(id, 1)
	if errUserAdmire == true {
		result.IsSuccess = false
		result.ErrMsg = "你已经点过赞了!"
	} else if errIdStatus != nil {
		result.IsSuccess = false
		result.ErrMsg = "无法点赞"
	} else {
		addAdmireNumStatus := colorlife.UpdateAdmireNum(id)
		errAddAdmireStatus := admireService.AddAdmire(id, 2, 1, name, Uid)
		admireRedis.AddUserColorlifeAdmires(int(id), Uid)
		count := admireRedis.AddAdmiresColorlife(int(id))
		fmt.Println(addAdmireNumStatus)
		fmt.Println(errAddAdmireStatus)
		if addAdmireNumStatus == nil && errAddAdmireStatus == true {
			result.IsSuccess = true
			result.ErrMsg = ""
			result.Count = count
		} else {
			result.IsSuccess = false
			result.ErrMsg = "系统错误"
		}
	}
	return result
}

func (this *ColorlifeService) UserAdmireStatus(id int64, uid int64) UserAdmireStatus {
	var admireRedis redisService.AdmireRedisService
	var colorlife colorlife.Colorlife
	var result UserAdmireStatus
	_, errIdStatus := colorlife.GetColorlifeById(id, 1)
	if errIdStatus != nil {
		result.ErrMsg = "请传递正确的id"
		result.IsSuccess = false
	} else {
		errUserAdmire := admireRedis.AdmireStatusColorlife(int(id), uid)
		if errUserAdmire == true {
			result.ErrMsg = ""
			result.IsSuccess = true
			result.Status = true
		} else {
			result.ErrMsg = ""
			result.IsSuccess = true
			result.Status = false
		}
	}
	return result
}

func (this *ColorlifeService) AddColorlifeComment(add comment.Comment) CommentResult {
	var result CommentResult
	var commentService commentService
	var colorlife colorlife.Colorlife
	var commentRedis redisService.CommentRedisService
	valid := validation.Validation{}
	val := validator.CommentValidation{
		Content:   add.Content,
		Uid:       add.Uid,
		Cid:       add.Cid,
		TargetUid: add.TargetUid,
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
		errUpdateCommentNum := colorlife.UpdateCommentNum(add.Cid)
		CommentNum := commentRedis.AddCommentColorlife(int(add.Cid))
		_, errAddComment := commentService.AddComment(add)
		if errUpdateCommentNum == nil && errAddComment == nil {
			result.ErrMsg = "添加成功"
			result.IsSuccess = true
			result.Count = CommentNum
		} else {
			result.ErrMsg = "系统错误"
			result.IsSuccess = false
		}
	}
	return result
}
