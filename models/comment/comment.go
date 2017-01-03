package comment

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type Comment struct {
	Id        int64  `orm:"column(Id);"`
	Cid       int64  `orm:"column(Cid);"`
	Uid       int64  `orm:"column(Uid);"`
	TargetUid int64  `orm:"column(TargetUid);"`
	Content   string `orm:"column(Uid);"`
	Status    int    `orm:"column(Uid);"`
	Types     int    `orm:"column(Types);"`
	Updated   string `orm:"column(Updated);"`
	Created   string `orm:"column(Created);"`
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
	comment.Status = 1
	comment.Cid = addItem.Cid
	comment.TargetUid = addItem.TargetUid
	comment.Content = addItem.Content
	comment.Types = addItem.Types
	comment.Created = time.Now().Format("2006-01-02 15:04:05")
	comment.Updated = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(comment)
	return id, err
}

func (this *Comment) CancelComment(id int64) {
	o := orm.NewOrm()
	o.Using("Qa")
	cancelComment := Comment{Id: id}
	err := o.Read(&cancelComment)
	if err == nil {
		cancelComment.Status = 0
		cancelComment.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&cancelComment, "Status", "Updated")
		return err
	}
	return err
}
