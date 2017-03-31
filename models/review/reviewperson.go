package review

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type ReviewPerson struct {
	Id             int64  `orm:"column(Id);"`
	ReviewStatusId int64  `orm:"column(ReviewStatusId);"`
	Auditor        int64  `orm:"column(Auditor);"`
	Detail         string `orm:"column(Detail);"`
	Status         int    `orm:"column(Status);"`
	Created        string `orm:"column(Created);"`
	Updated        string `orm:"column(Updated);"`
}

type Items struct {
	Datas []orm.Params
	Total int64
}

func (this *ReviewPerson) TableName() string {
	return "reviewperson"
}

func init() {
	orm.RegisterModel(new(ReviewPerson))
}

func (this *ReviewPerson) AddReviewPerson(addItem ReviewPerson) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	reviewperson := new(ReviewPerson)
	reviewstatus.ReviewStatusId = addItem.ReviewStatusId
	reviewstatus.Auditor = addItem.Auditor
	reviewstatus.Status = addItem.Status
	reviewperson.Updated = time.Now().Format("2006-01-02 15:04:05")
	reviewperson.Created = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(reviewperson)
	return id, err
}

func (this *ReviewPerson) DeleteReviewPersonByReviewStatusId(reviewStatusId int64) error {
	o := orm.NewOrm()
	o.Using("Qa")
	reviewperson := ReviewPerson{ReviewStatusId: reviewStatusId}
	err := o.Read(&reviewperson, "ReviewStatusId")
	if err == nil {
		_, err := o.Delete(&reviewperson)
		return err
	}
	return err
}
func (this *ReviewPerson) ChangeAuditor(auditor int64, tagetAuditor int64, reviewStatusId int64) error {
	o := orm.NewOrm()
	o.Using("Qa")
	reviewperson := ReviewPerson{ReviewStatusId: reviewStatusId, Auditor: auditor}
	err := o.Read(&reviewperson, "ReviewStatusId", "Auditor")
	if err == nil {
		reviewperson.Auditor = auditor
		reviewperson.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&reviewperson, "Updated", "Auditor")
		return err
	}
	return err
}
