package review

import (
	"github.com/astaxie/beego/orm"
	"reflect"
	"time"
)

type ReviewPerson struct {
	Id             int64  `orm:"column(Id);"`
	ReviewStatusId int64  `orm:"column(ReviewStatusId);"`
	Type           string `orm:"column(Type);"`
	Level          int    `orm:"column(Level);"`
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

func (this *ReviewPerson) Add(addItem ReviewPerson) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	reviewperson := new(ReviewPerson)
	reviewperson.ReviewStatusId = addItem.ReviewStatusId
	reviewperson.Auditor = addItem.Auditor
	reviewperson.Status = APPROVAL_INIT
	reviewperson.Type = addItem.Type
	re := reflect.ValueOf(addItem)
	detail := re.FieldByName("Detail").String()
	if detail != "" {
		reviewperson.Detail = detail
	}
	reviewperson.Level = addItem.Level
	reviewperson.Updated = time.Now().Format("2006-01-02 15:04:05")
	reviewperson.Created = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(reviewperson)
	return id, err
}

func (this *ReviewPerson) Delete(reviewStatusId int64) error {
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

func (this *ReviewPerson) UpdateAuditor(reviewStatusId int64, orginAuditor int64, Targetauditor int64) error {
	o := orm.NewOrm()
	o.Using("Qa")
	reviewperson := ReviewPerson{ReviewStatusId: reviewStatusId, Status: APPROVAL_INIT, Auditor: orginAuditor}
	err := o.Read(&reviewperson, "ReviewStatusId", "Status", "Auditor")
	if err == nil {
		reviewperson.Auditor = Targetauditor
		reviewperson.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&reviewperson, "Updated", "Auditor")
		return err
	}
	return err
}

func (this *ReviewPerson) UpdateStatusAndDetail(id int64, status int, detail string) error {
	o := orm.NewOrm()
	o.Using("Qa")
	reviewperson := ReviewPerson{Id: id}
	err := o.Read(&reviewperson, "Id")
	if err == nil {
		reviewperson.Status = status
		reviewperson.Updated = time.Now().Format("2006-01-02 15:04:05")
		if detail != "" {
			reviewperson.Detail = detail
			_, err := o.Update(&reviewperson, "Updated", "Status", "Detail")
			return err
		} else {
			_, err := o.Update(&reviewperson, "Updated", "Status")
			return err
		}
	}
	return err
}
