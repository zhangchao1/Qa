package api

import (
	"Qa/models/article"
	"Qa/models/comment"
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
	if id == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		data, err := articleService.GetArticleByAid(id, 1)
		fmt.Println(err)
		if err != nil {
			this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "无效的id"}
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

// @router /recyle [get]
func (this *Article) Recyle() {
	var articleService qa.ArticleService
	id, _ := this.GetInt64("id")
	if id == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		result := articleService.Recyle(id)
		this.Data["json"] = result
		this.ServeJSON()
	}
}

// @router /recover [get]
func (this *Article) Recover() {
	var articleService qa.ArticleService
	id, _ := this.GetInt64("id")
	if id == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		result := articleService.Recover(id)
		this.Data["json"] = result
		this.ServeJSON()
	}
}

// @router /recycleList [get]
func (this *Article) RecycleList() {
	var articles article.Article
	var result article.Items
	startIndex, _ := this.GetInt64("start")
	maxCounts, _ := this.GetInt64("max")
	if startIndex == 0 || maxCounts == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		result = articles.RecyleList(startIndex, maxCounts, "-Updated")
		this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "data": result}
		this.ServeJSON()
	}
}

// @router /myarticle [get]
func (this *Article) MyArticleList() {
	var articles article.Article
	var result article.Items
	startIndex, _ := this.GetInt64("start")
	maxCounts, _ := this.GetInt64("max")
	if startIndex == 0 || maxCounts == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		result = articles.MyArticleList(startIndex, maxCounts, "-Updated")
		this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "data": result}
		this.ServeJSON()
	}
}

// @router /delete [get]
func (this *Article) DeleteArticle() {
	var articleService qa.ArticleService
	id, _ := this.GetInt64("id")
	if id == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		result := articleService.Delete(id)
		this.Data["json"] = result
		this.ServeJSON()
	}
}

// @router /admire [get]
func (this *Article) AdmireArticle() {
	var articleService qa.ArticleService
	id, _ := this.GetInt64("id")
	if id == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		result := articleService.AddAdmrie(id)
		this.Data["json"] = result
		this.ServeJSON()
	}
}

// @router /admirestatus [get]
func (this *Article) UserAdmireStatus() {
	var articleService qa.ArticleService
	id, _ := this.GetInt64("id")
	if id == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		result := articleService.UserAdmireStatus(id, 1)
		this.Data["json"] = result
		this.ServeJSON()
	}
}

// @router /addcomment [post]
func (this *Article) AddComment() {
	var articleService qa.ArticleService
	var addComment comment.Comment
	json.Unmarshal(this.Ctx.Input.RequestBody, &addComment)
	addComment.Types = 1
	addComment.Uid = 1
	addComment.TargetUid = 2
	result := articleService.AddArticleComment(addComment)
	fmt.Println(result)
	this.Data["json"] = result
	this.ServeJSON()
}

// @router /commentlist [get]
func (this *Article) ArticleCommentList() {
	var Comment comment.Comment
	var result comment.Items
	id, _ := this.GetInt64("id")
	startIndex, _ := this.GetInt64("start")
	maxCounts, _ := this.GetInt64("max")
	if startIndex == 0 || maxCounts == 0 || id == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		result = Comment.CommentList(startIndex, maxCounts, "-Created", id, 1)
		this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "data": result}
		this.ServeJSON()
	}
}

// @router /test [get]
func (this *Article) Test() {
	var adminservice qa.AdminService
	var Data qa.Alldes
	adminservice.GetAllDeparment(0, &Data)
	this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "Data": Data.Children}
	this.ServeJSON()
}
