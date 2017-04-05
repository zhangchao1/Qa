package leave

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type Leave struct {
	Id         int64  `orm:"column(Id);"`
	Uid        int64  `orm:"column(Uid);"`
	Type       int    `orm:"column(Type);"`
	StartTime  string `orm:"column(StartTime);"`
	EndTime    string `orm:"column(EndTime);"`
	Reason     string `orm:"column(Reason);"`
	AttachMent string `orm:"column(AttachMent);"`
	LongTime   string `orm:"column(LongTime);"`
	Updated    string `orm:"column(Updated);"`
	Created    string `orm:"column(Created);"`
}

func (this *Leave) TableName() string {
	return "leave"
}

func (this *Leave) Add(addItem Leave) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	leave := new(Leave)
	leave.Uid = addItem.Uid
	leave.Reason = addItem.Reason
	leave.StartTime = addItem.StartTime
	leave.AttachMent = addItem.AttachMent
	leave.LongTime = addItem.LongTime
	leave.EndTime = addItem.EndTime
	leave.Type = addItem.Type
	leave.Updated = time.Now().Format("2006-01-02 15:04:05")
	leave.Created = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(leave)
	return id, err
}
