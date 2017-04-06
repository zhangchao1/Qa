package leave

import (
	"github.com/astaxie/beego/orm"
	"math"
	"reflect"
	"time"
)

type Leave struct {
	Id         int64  `orm:"column(Id);"`
	Uid        int64  `orm:"column(Uid);"`
	Type       string `orm:"column(Type);"`
	StartTime  string `orm:"column(StartTime);"`
	EndTime    string `orm:"column(EndTime);"`
	Reason     string `orm:"column(Reason);"`
	AttachMent string `orm:"column(AttachMent);"`
	LongTime   string `orm:"column(LongTime);"`
	Updated    string `orm:"column(Updated);"`
	Created    string `orm:"column(Created);"`
}

const QUERY_LEAVE_DETAIL = "select le.*, res.* from `leave` as le left join reviewstatus as res on res.ReviewId = le.Id where le.Id = ? AND res.Type = 'leave'"
const QUERY_LEAVE_STATUS_COUNT = "select count(*) as cnt from `leave` as le left join reviewstatus as res on res.ReviewId = le.Id where res.Status = ? AND res.Type = 'leave'"
const QUERY_LEAVE_STATUS = "select le.*, res.* from `leave` as le left join reviewstatus as res on res.ReviewId = le.Id where res.Status = ? AND res.Type = 'leave' ORDER BY res.Updated desc Limit ?,?"

func (this *Leave) TableName() string {
	return "leave"
}

type Items struct {
	Datas []orm.Params
	Total int64
}

func (this *Leave) Add(addItem Leave) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	leave := new(Leave)
	leave.Uid = addItem.Uid
	leave.Reason = addItem.Reason
	leave.StartTime = addItem.StartTime
	le := reflect.ValueOf(addItem)
	attachMent := le.FieldByName("AttachMent").String()
	if attachMent != "" {
		leave.AttachMent = addItem.AttachMent
	}
	leave.LongTime = addItem.LongTime
	leave.EndTime = addItem.EndTime
	leave.Type = addItem.Type
	leave.Updated = time.Now().Format("2006-01-02 15:04:05")
	leave.Created = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(leave)
	return id, err
}

func (this *Leave) Detail(id int64) []orm.Params {
	o := orm.NewOrm()
	o.Using("Qa")
	var maps []orm.Params
	o.Raw(QUERY_LEAVE_DETAIL, id).Values(&maps)
	return maps
}

func (this *Leave) GetLeaveByStatus(start int64, max int64, status int) Items {
	o := orm.NewOrm()
	o.Using("Qa")
	var items Items
	var totalPage int64
	var maps []orm.Params
	o.Raw(QUERY_LEAVE_STATUS_COUNT, status).Values(&maps)
	cnt, _ := maps[0]["cnt"].(int)
	count := float64(cnt)
	maxCount := float64(max)
	pages := float64(count / maxCount)
	totalPage = int64(math.Ceil(pages))
	offset := (start - 1) * max
	limit := max
	o.Raw(QUERY_LEAVE_STATUS, status, offset, limit).Values(&maps)
	items.Datas = maps
	items.Total = totalPage
	return items
}
