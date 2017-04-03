package review

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type ReviewNode struct {
	Id             int64  `orm:"column(Id);"`
	ReviewStatusId int64  `orm:"column(ReviewStatusId);"`
	OperateUid     int64  `orm:"column(OperateUid);"`
	Level          int    `orm:"column(Level);"`
	Status         int    `orm:"column(Status);"`
	EndorseUid     int64  `orm:"column(EndorseUid);"`
	Created        string `orm:"column(Created);"`
	Updated        string `orm:"column(Updated);"`
}

func (this *ReviewNode) TableName() string {
	return "reviewnode"
}

func init() {
	orm.RegisterModel(new(ReviewNode))
}

func (this *ReviewNode) Add(addItem ReviewNode) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	reviewnode := new(ReviewNode)
	reviewnode.ReviewStatusId = addItem.ReviewStatusId
	reviewnode.OperateUid = addItem.OperateUid
	reviewnode.Level = addItem.Level
	reviewnode.Status = addItem.Status
	reviewnode.Updated = time.Now().Format("2006-01-02 15:04:05")
	reviewnode.Created = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(reviewnode)
	return id, err
}

func (this *ReviewNode) Delete(reviewStatusId int64) error {
	o := orm.NewOrm()
	o.Using("Qa")
	reviewnode := ReviewNode{ReviewStatusId: reviewStatusId}
	err := o.Read(&reviewnode, "ReviewStatusId")
	if err == nil {
		_, err := o.Delete(&reviewnode)
		return err
	}
	return err
}

func (this *ReviewNode) ChangeStatus(id int64, status int) error {
	o := orm.NewOrm()
	o.Using("Qa")
	reviewnode := ReviewNode{Id: id}
	err := o.Read(&reviewnode, "Id")
	if err == nil {
		reviewnode.Status = status
		reviewnode.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&reviewnode, "Updated", "Status")
		return err
	}
	return err
}

func (this *ReviewNode) addEndorseUid(id int64, endorseUid int64) error {
	o := orm.NewOrm()
	o.Using("Qa")
	reviewnode := ReviewNode{Id: id}
	err := o.Read(&reviewnode, "Id")
	if err == nil {
		reviewnode.EndorseUid = endorseUid
		reviewnode.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&reviewnode, "Updated", "EndorseUid")
		return err
	}
	return err
}
