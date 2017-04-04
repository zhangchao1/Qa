package review

import (
	"github.com/astaxie/beego/orm"
	"math"
	"reflect"
	"time"
)

const APPROVAL_INIT = 1
const APPROVAL_PASS = 2
const APPROVAL_REFUSE = 3
const APPROVAL_CANCEL = 4

type ReviewStatus struct {
	Id      int64  `orm:"column(Id);"`
	Type    string `orm:"column(Type);"`
	Uid     int64  `orm:"column(Uid);"`
	Detail  string `orm:"column(Detail);"`
	Status  int    `orm:"column(Status);"`
	Created string `orm:"column(Created);"`
	Updated string `orm:"column(Updated);"`
}

func (this *ReviewStatus) TableName() string {
	return "reviewstatus"
}

func init() {
	orm.RegisterModel(new(ReviewStatus))
}

func (this *ReviewStatus) Add(addItem ReviewStatus) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	reviewstatus := new(ReviewStatus)
	reviewstatus.Type = addItem.Type
	reviewstatus.Uid = addItem.Uid
	re := reflect.ValueOf(addItem)
	detail := re.FieldByName("Detail").String()
	if detail != "" {
		reviewstatus.Detail = detail
	}
	reviewstatus.Status = APPROVAL_INIT
	reviewstatus.Updated = time.Now().Format("2006-01-02 15:04:05")
	reviewstatus.Created = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(reviewstatus)
	return id, err
}

func (this *ReviewStatus) ChangeStatus(sid int64, status int) error {
	o := orm.NewOrm()
	o.Using("Qa")
	reviewstatus := ReviewStatus{Id: sid}
	err := o.Read(&reviewstatus, "Id")
	if err == nil {
		reviewstatus.Status = status
		reviewstatus.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&reviewstatus, "Status", "Updated")
		return err
	}
	return err
}

func (this *ReviewStatus) GetByStatus(Uid int64, Type string, status int, start int64, max int64,
	orderBy string) Items {
	o := orm.NewOrm()
	o.Using("Qa")
	var maps []orm.Params
	var items Items
	var totalPage int64
	cnt, err := o.QueryTable("reviewstatus").Filter("Status", status).Filter("Uid", Uid).Count()
	if err != nil {
		cnt = 0
	}
	count := float64(cnt)
	maxCount := float64(max)
	pages := float64(count / maxCount)
	totalPage = int64(math.Ceil(pages))
	offset := (start - 1) * max
	limit := max
	o.QueryTable("reviewstatus").Filter("Status", status).Filter("Uid", Uid).Limit(limit, offset).OrderBy(orderBy).Values(&maps)
	items.Datas = maps
	items.Total = totalPage
	return items
}
