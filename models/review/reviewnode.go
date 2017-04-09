package review

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type ReviewNode struct {
	Id             int64  `orm:"column(Id);"`
	ReviewStatusId int64  `orm:"column(ReviewStatusId);"`
	OperateUid     int64  `orm:"column(OperateUid);"`
	Type           string `orm:"column(Type);"`
	Level          int    `orm:"column(Level);"`
	Status         int    `orm:"column(Status);"`
	EndorseUid     int64  `orm:"column(EndorseUid);"`
	Created        string `orm:"column(Created);"`
	Updated        string `orm:"column(Updated);"`
}

const DELETE_REVIEW_NODE = "DELETE FROM reviewnode WHERE ReviewStatusId=? AND `Type`=?"

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
	reviewnode.Type = addItem.Type
	reviewnode.Status = APPROVAL_INIT
	reviewnode.Updated = time.Now().Format("2006-01-02 15:04:05")
	reviewnode.Created = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(reviewnode)
	return id, err
}

func (this *ReviewNode) Delete(reviewStatusId int64, types string) error {
	o := orm.NewOrm()
	o.Using("Qa")
	_, err := o.Raw(DELETE_REVIEW_NODE, reviewStatusId, types).Exec()
	return err
}

func (this *ReviewNode) ChangeStatusByLevel(reviewStatusId int64, level int, types string, status int) error {
	o := orm.NewOrm()
	o.Using("Qa")
	reviewnode := ReviewNode{ReviewStatusId: reviewStatusId, Level: level, Type: types}
	err := o.Read(&reviewnode, "ReviewStatusId", "Level", "Type")
	if err == nil {
		reviewnode.Status = status
		reviewnode.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&reviewnode, "Updated", "Status")
		return err
	}
	return err
}

func (this *ReviewNode) AddEndorseUid(id int64, endorseUid int64) error {
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

func (this *ReviewNode) GetReviewNodeByLevel(reviewStatusId int64, level int, types string) (ReviewNode, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	reviewnode := ReviewNode{ReviewStatusId: reviewStatusId, Level: level, Type: types}
	err := o.Read(&reviewnode, "ReviewStatusId", "Level")
	return reviewnode, err
}
