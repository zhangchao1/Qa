package api

import (
	"Qa/models/article"
	"Qa/service/qa"
	"encoding/json"
	"fmt"
)

type Article struct {
	ControllerBase
}
type GetResult struct {
	IsSuccess bool
	data      map[string]map[string]interface{}
}

// @router /add [post]
func (this *Article) Add() {
	var addArticle article.Article
	json.Unmarshal(this.Ctx.Input.RequestBody, &addArticle)
	var articleService qa.ArticleService
	result := articleService.Add(addArticle)
	fmt.Println(result)
	this.Data["json"] = result
	this.ServeJSON()
}

// @router /getArticle [get]
func (this *Article) GetArticle() {
	var articleService qa.ArticleService
	id, _ := this.GetInt64("id")
	fmt.Println(id)
	if id == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		data, err := articleService.GetArticleById(id)
		fmt.Println(data, err)
		if err != nil {
			this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "系统错误"}
			this.ServeJSON()
		} else {
			this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "data": data}
			this.ServeJSON()
		}
	}
}

// @router /edit [post]
func (this *Article) Edit() {
	var addArticle article.Article
	json.Unmarshal(this.Ctx.Input.RequestBody, &addArticle)
	var articleService qa.ArticleService
	result := articleService.Edit(addArticle)
	fmt.Println(result)
	this.Data["json"] = result
	this.ServeJSON()
}
