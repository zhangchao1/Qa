package qa

import (
	"Qa/models/article"
	"Qa/service/redisService"
	"Qa/validator"
	"fmt"
	"github.com/astaxie/beego/validation"
)

type ArticleService struct {
}

type SaveResult struct {
	IsSuccess bool
	ErrMsg    string
}
type AdmireResult struct {
	IsSuccess bool
	ErrMsg    string
	Count     int64
}

func (this *ArticleService) Add(addArticle article.Article) SaveResult {
	var result SaveResult
	var article article.Article
	valid := validation.Validation{}
	val := validator.ArticleSaveValidation{
		Uid:         addArticle.Uid,
		Title:       addArticle.Title,
		Content:     addArticle.Content,
		Description: addArticle.Description,
		Tag:         addArticle.Tag,
		Types:       addArticle.Types,
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
		_, err := article.AddArticle(addArticle)
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

func (this *ArticleService) GetArticleByAid(id int64, status int) (article.Article, error) {
	var data article.Article
	var article article.Article
	data, err := article.GetArticleById(id, status)
	return data, err
}

func (this *ArticleService) Edit(editArticle article.Article) SaveResult {
	var result SaveResult
	var article article.Article
	valid := validation.Validation{}
	val := validator.ArticleEditValidation{
		Id:          editArticle.Id,
		Title:       editArticle.Title,
		Content:     editArticle.Content,
		Description: editArticle.Description,
		Tag:         editArticle.Tag,
		Types:       editArticle.Types,
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
		err := article.EditArticle(editArticle.Id, editArticle)
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

func (this *ArticleService) Recyle(id int64) SaveResult {
	var result SaveResult
	var article article.Article
	err := article.ChangeArticleStatus(id, 0)
	if err == nil {
		result.ErrMsg = "删除成功"
		result.IsSuccess = true
	} else {
		result.ErrMsg = "系统错误"
		result.IsSuccess = false
	}
	return result
}

func (this *ArticleService) Recover(id int64) SaveResult {
	var result SaveResult
	var article article.Article
	err := article.ChangeArticleStatus(id, 1)
	if err == nil {
		result.ErrMsg = "还原成功"
		result.IsSuccess = true
	} else {
		result.ErrMsg = "系统错误"
		result.IsSuccess = false
	}
	return result
}

func (this *ArticleService) Delete(id int64) SaveResult {
	var result SaveResult
	var article article.Article
	err := article.DeleteArticle(id)
	if err == nil {
		result.ErrMsg = "删除成功"
		result.IsSuccess = true
	} else {
		result.ErrMsg = "系统错误"
		result.IsSuccess = false
	}
	return result
}

func (this *ArticleService) AddAdmrie(id int64) AdmireResult {
	var article article.Article
	var admireService AdmireService
	var admireRedis redisService.AdmireRedisService
	var result AdmireResult
	errUserAdmire := admireRedis.AdmireStatusArticle(int(id), 1)
	if errUserAdmire == true {
		result.IsSuccess = false
		result.ErrMsg = "你已经点过赞了!"
	} else {
		addAdmireNumStatus := article.UpdateAdmireNum(id)
		errAddAdmireStatus := admireService.AddAdmire(id, 1, 1, "chaochao", 1)
		admireRedis.AddUserAdmires(int(id), 1)
		count := admireRedis.AddAdmiresArticle(int(id))
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
