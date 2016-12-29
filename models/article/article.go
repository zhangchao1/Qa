package article

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type Article struct {
	Id          int64  `orm:"column(aid);"`
	Uid         int64  `orm:"column(uid);"`
	Title       string `orm:"column(title);"`
	Content     string `orm:"column(content);"`
	Description string `orm:"column(description);"`
	Tag         string `orm:"column(tag);"`
	Types       string `orm:"column(types);"`
	Status      int    `orm:"column(status);"`
	AdmireNum   int    `orm:"column(admireNum);"`
	CommentNum  int    `orm:"column(commentNum);"`
	ViewNum     int    `orm:"column(viewNum);"`
	Updated     string `orm:"column(updated);"`
	Created     string `orm:"column(created);"`
}

func (m *Article) TableName() string {
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
func AddArticle(addItem Article) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	article := new(Article)
	article.Uid = addItem.Uid
	article.Title = addItem.Title
	article.Content = addItem.Content
	article.Tag = addItem.Tag
	article.Types = addItem.Types
	article.Description = addItem.Description
	article.Status = 0
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
func EditArticle(id int64, editItem Article) error {
	o := orm.NewOrm()
	o.Using("Qa")
	var article Article
	article = Article{Id: id}
	if o.Read(&article) == nil {
		article.Title = editItem.Title
		article.Content = editItem.Content
		article.Tag = editItem.Tag
		article.Types = editItem.Types
		article.Description = editItem.Description
		article.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&article, "title", "content", "tag", "types", "description")
		return err
	}
	return nil
}

/**
 * 通过文章id获取文章的详情
 * [GetArticleById description]
 * @param {[type]} id int64) (item Article, err error [description]
 */
func GetArticleById(id int64) (item Article, err error) {
	o := orm.NewOrm()
	o.Using("Qa")
	article := Article{Id: id}
	err = o.Read(&article)
	return article, err
}
