package qa

import (
	"Qa/models/article"
)

type ArticleService struct {
}

type AddResult struct {
	is_success bool
	errmsg     string
}

func (this *ArticleService) Add(add article.Article) AddResult {
	var newArticle article.Article
	var result AddResult
	newArticle.Uid = add.Uid
	newArticle.Title = add.Title
	newArticle.Content = add.Content
	newArticle.Tag = add.Tag
	newArticle.Types = add.Types
	newArticle.Description = add.Description
	_, err := article.AddArticle(newArticle)
	if err != nil {
		result.errmsg = "系统错误"
		result.is_success = false
	} else {
		result.errmsg = "保存成功"
		result.is_success = true
	}
	return result
}
