package review

import (
	"github.com/astaxie/beego/orm"
	"math"
	"reflect"
	"time"
)

type ReviewPerson struct {
	Id             int64  `orm:"column(Id);"`
	ReviewStatusId int64  `orm:"column(ReviewStatusId);"`
	Type           string `orm:"column(Type);"`
	Level          int    `orm:"column(Level);"`
	Uid            int64  `orm:"column(Uid);"`
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
	reviewperson.Uid = addItem.Uid
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

func (this *ReviewPerson) Delete(reviewStatusId int64, types string) error {
	o := orm.NewOrm()
	o.Using("Qa")
	reviewperson := ReviewPerson{ReviewStatusId: reviewStatusId, Type: types}
	err := o.Read(&reviewperson, "ReviewStatusId", "Type")
	if err == nil {
		_, err := o.Delete(&reviewperson)
		return err
	}
	return err
}

func (this *ReviewPerson) UpdateAuditor(reviewStatusId int64, orginAuditor int64, Targetauditor int64, types string) error {
	o := orm.NewOrm()
	o.Using("Qa")
	reviewperson := ReviewPerson{ReviewStatusId: reviewStatusId, Status: APPROVAL_INIT, Auditor: orginAuditor, Type: types}
	err := o.Read(&reviewperson, "ReviewStatusId", "Status", "Auditor", "Type")
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

func (this *ReviewPerson) List(start int64, max int64, uid int64, types string, status int) Items {
	o := orm.NewOrm()
	o.Using("Qa")
	var maps []orm.Params
	var items Items
	var totalPage int64
	cnt, err := o.QueryTable("reviewperson").Filter("Auditor", uid).Filter("Type", types).Filter("Status", status).Count()
	if err != nil {
		cnt = 0
	}
	count := float64(cnt)
	maxCount := float64(max)
	pages := float64(count / maxCount)
	totalPage = int64(math.Ceil(pages))
	offset := (start - 1) * max
	limit := max
	o.QueryTable("reviewperson").Filter("Auditor", uid).Filter("Type", types).Filter("Status", status).Limit(limit, offset).Values(&maps)
	items.Datas = maps
	items.Total = totalPage
	return items
}
