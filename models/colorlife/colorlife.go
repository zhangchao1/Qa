package colorlife

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type Colorlife struct {
	Id          int64  `orm:"column(Id);"`
	Uid         int64  `orm:"column(Uid);"`
	Title       string `orm:"column(Title);"`
	Tag         string `orm:"column(Tag);"`
	Description string `orm:"column(Description);"`
	Ablums      string `orm:"column(Ablums);"`
	Status      int    `orm:"column(Status);"`
	AdmireNum   int    `orm:"column(AdmireNum);"`
	CommentNum  int    `orm:"column(CommentNum);"`
	ViewNum     int    `orm:"column(ViewNum);"`
	IsPublic    int    `orm:"column(IsPublic);"`
	Updated     string `orm:"column(Updated);"`
	Created     string `orm:"column(Created);"`
}

func (this *Colorlife) TableName() string {
	return "colorlife"
}

const ONUSE = 1

func init() {
	orm.RegisterModel(new(Colorlife))
}

/**
 * 增加文章
 * [AddArticle description]
 * @param {[type]} updAlb Article) (int64, error [description]
 */
func (this *Colorlife) AddColorlife(addItem Colorlife) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	colorlife := new(Colorlife)
	colorlife.Uid = addItem.Uid
	colorlife.Title = addItem.Title
	colorlife.Tag = addItem.Tag
	colorlife.Description = addItem.Description
	colorlife.Ablums = addItem.Ablums
	colorlife.IsPublic = addItem.IsPublic
	colorlife.Status = ONUSE
	colorlife.AdmireNum = 0
	colorlife.CommentNum = 0
	colorlife.ViewNum = 0
	colorlife.Updated = time.Now().Format("2006-01-02 15:04:05")
	colorlife.Created = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(colorlife)
	return id, err
}
