package overtime

import (
	"github.com/astaxie/beego/orm"
	"math"
	"strconv"
	"time"
)

type OverTime struct {
	Id           int64  `orm:"column(Id);"`
	Uid          int64  `orm:"column(Uid);"`
	EqualizeType string `orm:"column(EqualizeType);"`
	IsOutside    string `orm:"column(IsOutside);"`
	StartTime    string `orm:"column(StartTime);"`
	EndTime      string `orm:"column(EndTime);"`
	LongTime     string `orm:"column(LongTime);"`
	Reason       string `orm:"column(Reason);"`
	Updated      string `orm:"column(Updated);"`
	Created      string `orm:"column(Created);"`
}

const QUERY_OVERTIME_DETAIL = "select * from `overtime` where Id = ?"
const QUERY_OVERTIME_STATUS_COUNT = "select count(*) as cnt from `overtime` as ot left join reviewstatus as res on res.ReviewId = ot.Id where res.Status = ? AND ot.Uid = ? AND res.Type = 'overtime'"
const QUERY_OVERTIME_STATUS = `select ot.Id as OtId,
                            ot.EqualizeType as Type,
                            ot.IsOutside as IsOutside,
                            ot.Reason as Reason,
                            ot.LongTime as LongTime,
                            ot.StartTime as StartTime,
                            ot.EndTime as Endtime,
                            ot.Updated as Updated,
                            res.Id as ReId,
                            res.Status as Status
                            from qa.overtime as ot left 
                            join reviewstatus as res 
                            on res.ReviewId = ot.Id 
                            where res.Status = ? AND ot.Uid = ? 
                            AND res.Type = 'overtime' 
                            ORDER BY res.Updated desc Limit ?,?`

type Items struct {
	Datas []orm.Params
	Total int64
}

func (this *OverTime) TableName() string {
	return "overtime"
}

func init() {
	orm.RegisterModel(new(OverTime))
}

func (this *OverTime) Add(addItem OverTime) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	overtime := new(OverTime)
	overtime.Uid = addItem.Uid
	overtime.EqualizeType = addItem.EqualizeType
	overtime.IsOutside = addItem.IsOutside
	overtime.StartTime = addItem.StartTime
	overtime.EndTime = addItem.EndTime
	overtime.LongTime = addItem.LongTime
	overtime.Reason = addItem.Reason
	overtime.Updated = time.Now().Format("2006-01-02 15:04:05")
	overtime.Created = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(overtime)
	return id, err
}

func (this *OverTime) Detail(id int64) []orm.Params {
	o := orm.NewOrm()
	o.Using("Qa")
	var maps []orm.Params
	o.Raw(QUERY_OVERTIME_DETAIL, id).Values(&maps)
	return maps
}

func (this *OverTime) GetLeaveByStatus(start int64, max int64, status int, uid int64) Items {
	o := orm.NewOrm()
	o.Using("Qa")
	var items Items
	var totalPage int64
	var maps []orm.Params
	o.Raw(QUERY_OVERTIME_STATUS_COUNT, status, uid).Values(&maps)
	cnt, _ := maps[0]["cnt"].(string)
	totals, _ := strconv.ParseInt(cnt, 10, 64)
	count := float64(totals)
	maxCount := float64(max)
	pages := float64(count / maxCount)
	totalPage = int64(math.Ceil(pages))
	offset := (start - 1) * max
	limit := max
	o.Raw(QUERY_OVERTIME_STATUS, status, uid, offset, limit).Values(&maps)
	items.Datas = maps
	items.Total = totalPage
	return items
}
