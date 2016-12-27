package qa

import (
	"Qa/models/article"
	"github.com/astaxie/beego/validation"
)

type ArticleService struct {
}

type SaveResult struct {
	IsSuccess bool
	ErrMsg    string
}

func (this *ArticleService) Add(addArticle article.Article) SaveResult {
	var newArticle article.Article
	var result SaveResult
	newArticle.Uid = addArticle.Uid
	newArticle.Title = addArticle.Title
	newArticle.Content = addArticle.Content
	newArticle.Tag = addArticle.Tag
	newArticle.Types = addArticle.Types
	newArticle.Description = addArticle.Description
	_, err := article.AddArticle(newArticle)
	if err != nil {
		result.ErrMsg = "系统错误"
		result.IsSuccess = false
	} else {
		result.ErrMsg = "保存成功"
		result.IsSuccess = true
	}
	return result
}
