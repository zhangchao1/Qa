package qa

import (
	"Qa/models/article"
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

func (this *ArticleService) Add(addArticle article.Article) SaveResult {
	var result SaveResult
	valid := validation.Validation{}
	val := validator.ArticleSaveValidation{
		Uid:         addArticle.Uid,
		Title:       addArticle.Title,
		Content:     addArticle.Content,
		Description: addArticle.Description,
		Tag:         addArticle.Tag,
		Types:       addArticle.Types,
	}
	fmt.Println(val)
	is, err := valid.Valid(&val)
	if err != nil {
		fmt.Println(err)
		result.ErrMsg = "传入正确的参数"
		result.IsSuccess = false
	} else if !is {
		for _, err := range valid.Errors {
			fmt.Println(err.Key, err.Message)
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

func (this *ArticleService) GetArticleById(Id int64) (article.Article, error) {
	var data article.Article
	data, err := article.GetArticleById(Id)
	return data, err
}

func (this *ArticleService) Edit(EditArticle article.Article) SaveResult {
	var result SaveResult
	valid := validation.Validation{}
	val := validator.ArticleEditValidation{
		Id:          EditArticle.Id,
		Title:       EditArticle.Title,
		Content:     EditArticle.Content,
		Description: EditArticle.Description,
		Tag:         EditArticle.Tag,
		Types:       EditArticle.Types,
	}
	fmt.Println(val)
	is, err := valid.Valid(&val)
	if err != nil {
		fmt.Println(err)
		result.ErrMsg = "传入正确的参数"
		result.IsSuccess = false
	} else if !is {
		for _, err := range valid.Errors {
			fmt.Println(err.Key, err.Message)
			result.ErrMsg = fmt.Sprintf("%s:%s", err.Key, err.Message)
		}
		result.IsSuccess = false
	} else {
		err := article.EditArticle(EditArticle.Id, EditArticle)
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
