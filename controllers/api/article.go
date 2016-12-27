package api

import (
	"Qa/models/article"
	"Qa/service/qa"
	"fmt"
)

type Article struct {
	ControllerBase
}

// @router /add [get]
func (this *Article) Add() {
	var addArticle article.Article
	var articleService qa.ArticleService
	addArticle.Uid, _ = this.GetInt64("uid")
	addArticle.Title = this.GetString("title")
	addArticle.Content = this.GetString("content")
	addArticle.Tag = this.GetString("tag")
	addArticle.Types = this.GetString("types")
	addArticle.Description = this.GetString("description")
	result := articleService.Add(addArticle)
	fmt.Println(result)
	this.Data["json"] = result
	this.ServeJSON()
}
