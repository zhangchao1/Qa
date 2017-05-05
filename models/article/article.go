package article

import (
	"github.com/astaxie/beego/orm"
	"math"
	"time"
)

const ONLINE_ARTICLE = 1
const RECYLE_ARTICLE = 0

type Article struct {
	Id          int64  `orm:"column(Aid);"`
	Uid         int64  `orm:"column(Uid);"`
	Title       string `orm:"column(Title);"`
	Content     string `orm:"column(Content);"`
	Description string `orm:"column(Description);"`
	Tag         string `orm:"column(Tag);"`
	Types       string `orm:"column(Types);"`
	Status      int    `orm:"column(Status);"`
	AdmireNum   int    `orm:"column(AdmireNum);"`
	CommentNum  int    `orm:"column(CommentNum);"`
	ViewNum     int    `orm:"column(ViewNum);"`
	Updated     string `orm:"column(Updated);"`
	Created     string `orm:"column(Created);"`
}

type Items struct {
	Datas []orm.Params
	Total int64
}

func (this *Article) TableName() string {
	return "article"
}

func init() {
	orm.RegisterModel(new(Article))
}

/**
 * 增加文章
 * [AddArticle description]
 * @param {[type]} updAlb Article) (int64, error [description]
 */
func (this *Article) AddArticle(addItem Article) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	article := new(Article)
	article.Uid = addItem.Uid
	article.Title = addItem.Title
	article.Content = addItem.Content
	article.Tag = addItem.Tag
	article.Types = addItem.Types
	article.Description = addItem.Description
	article.Status = ONLINE_ARTICLE
	article.AdmireNum = 0
	article.CommentNum = 0
	article.ViewNum = 0
	article.Updated = time.Now().Format("2006-01-02 15:04:05")
	article.Created = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(article)
	return id, err
}

/**
 * 编辑文章
 * [EditArticle description]
 * @param {[type]} editItem Article) (error [description]
 */
func (this *Article) EditArticle(id int64, editItem Article) error {
	o := orm.NewOrm()
	o.Using("Qa")
	article := Article{Id: id}
	err := o.Read(&article)
	if err == nil {
		article.Title = editItem.Title
		article.Content = editItem.Content
		article.Tag = editItem.Tag
		article.Types = editItem.Types
		article.Description = editItem.Description
		article.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&article, "Title", "Content", "Tag", "Types", "Description", "Updated")
		return err
	}
	return err
}

/**
 * 通过文章id获取文章的详情
 * [GetArticleById description]
 * @param {[type]} id int64) (item Article, err error [description]
 */
func (this *Article) GetArticleById(id int64, status int) (item Article, err error) {
	o := orm.NewOrm()
	article := Article{Id: id, Status: status}
	err = o.Read(&article, "Id", "Status")
	return article, err
}

func (this *Article) UpdateAdmireNum(id int64) error {
	o := orm.NewOrm()
	o.Using("Qa")
	article := Article{Id: id}
	err := o.Read(&article)
	if err == nil {
		article.AdmireNum = article.AdmireNum + 1
		article.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&article, "AdmireNum", "Updated")
		return err
	}
	return err
}

func (this *Article) UpdateCommentNum(id int64) error {
	o := orm.NewOrm()
	o.Using("Qa")
	article := Article{Id: id}
	err := o.Read(&article)
	if err == nil {
		article.CommentNum = article.CommentNum + 1
		article.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&article, "CommentNum", "Updated")
		return err
	}
	return err
}

func (this *Article) UpdateViewNum(id int64) error {
	o := orm.NewOrm()
	o.Using("Qa")
	article := Article{Id: id}
	err := o.Read(&article)
	if err == nil {
		article.ViewNum = article.ViewNum + 1
		article.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&article, "ViewNum", "Updated")
		return err
	}
	return err
}

func (this *Article) ChangeArticleStatus(id int64, status int) error {
	o := orm.NewOrm()
	o.Using("Qa")
	article := Article{Id: id}
	err := o.Read(&article)
	if err == nil {
		article.Status = status
		article.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&article, "Status", "Updated")
		return err
	}
	return err
}

func (this *Article) DeleteArticle(id int64) error {
	o := orm.NewOrm()
	o.Using("Qa")
	var article Article
	article = Article{Id: id}
	_, err := o.Delete(&article)
	return err
}

func (this *Article) RecyleList(uid int64, start int64, max int64, orderBy string) Items {
	o := orm.NewOrm()
	o.Using("Qa")
	var maps []orm.Params
	var items Items
	var totalPage int64
	cnt, err := o.QueryTable("article").Filter("Status", 0).Filter("Uid", uid).Count()
	if err != nil {
		cnt = 0
	}
	count := float64(cnt)
	maxCount := float64(max)
	pages := float64(count / maxCount)
	totalPage = int64(math.Ceil(pages))
	offset := (start - 1) * max
	limit := max
	o.QueryTable("article").Filter("Status", 0).Filter("Uid", uid).Limit(limit, offset).OrderBy(orderBy).Values(&maps)
	items.Datas = maps
	items.Total = totalPage
	return items
}

func (this *Article) MyArticleList(uid int64, start int64, max int64, orderBy string) Items {
	o := orm.NewOrm()
	o.Using("Qa")
	var maps []orm.Params
	var items Items
	var totalPage int64
	cnt, err := o.QueryTable("article").Filter("Status", 1).Filter("Uid", uid).Count()
	if err != nil {
		cnt = 0
	}
	count := float64(cnt)
	maxCount := float64(max)
	pages := float64(count / maxCount)
	totalPage = int64(math.Ceil(pages))
	offset := (start - 1) * max
	limit := max
	o.QueryTable("article").Filter("Status", 1).Filter("Uid", uid).Limit(limit, offset).OrderBy(orderBy).Values(&maps)
	items.Datas = maps
	items.Total = totalPage
	return items
}
