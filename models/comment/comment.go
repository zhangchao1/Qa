package comment

import (
	"github.com/astaxie/beego/orm"
	"math"
	"time"
)

type Comment struct {
	Id        int64  `orm:"column(Id);"`
	Cid       int64  `orm:"column(Cid);"`
	Uid       int64  `orm:"column(Uid);"`
	TargetUid int64  `orm:"column(TargetUid);"`
	Content   string `orm:"column(Content);"`
	Types     int    `orm:"column(Types);"`
	Created   string `orm:"column(Created);"`
}

type Items struct {
	Datas []orm.Params
	Total int64
}

func (this *Comment) TableName() string {
	return "comment"
}

func init() {
	orm.RegisterModel(new(Comment))
}

func (this *Comment) AddComment(addItem Comment) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	comment := new(Comment)
	comment.Uid = addItem.Uid
	comment.Cid = addItem.Cid
	comment.TargetUid = addItem.TargetUid
	comment.Content = addItem.Content
	comment.Types = addItem.Types
	comment.Created = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(comment)
	return id, err
}

func (this *Comment) DeleteComment(id int64) error {
	o := orm.NewOrm()
	o.Using("Qa")
	cancelComment := Comment{Id: id}
	_, err := o.Delete(cancelComment)
	return err
}

func (this *Comment) CommentList(start int64, max int64, orderBy string, cid int64, types int) Items {
	o := orm.NewOrm()
	o.Using("Qa")
	var maps []orm.Params
	var items Items
	var totalPage int64
	cnt, err := o.QueryTable("comment").Filter("Cid", cid).Filter("Types", types).Count()
	if err != nil {
		cnt = 0
	}
	count := float64(cnt)
	maxCount := float64(max)
	pages := float64(count / maxCount)
	totalPage = int64(math.Ceil(pages))
	offset := (start - 1) * max
	limit := max
	o.QueryTable("comment").Filter("Cid", cid).Filter("Types", types).Limit(limit, offset).OrderBy(orderBy).Values(&maps)
	items.Datas = maps
	items.Total = totalPage
	return items
}
