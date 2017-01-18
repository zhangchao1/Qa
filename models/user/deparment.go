package user

import (
	"github.com/astaxie/beego/orm"
)

type Deparment struct {
	Id      int64  `orm:"column(DeparmentId);"`
	Pname   string `orm:"column(DeparmentName);"`
	Pid     int64  `orm:"column(ParentId);"`
	Level   int64  `orm:"column(Level);"`
	Created string `orm:"column(Created);"`
	Updated string `orm:"column(Updated);"`
}

func (this *Deparment) TableName() string {
	return "deparment"
}

func init() {
	orm.RegisterModel(new(Deparment))
}

func (this *Deparment) GetDeparment(pid int64) []orm.Params {
	var maps []orm.Params
	o := orm.NewOrm()
	o.Using("Qa")
	o.QueryTable("deparment").Filter("ParentId", pid).Values(&maps)
	return maps
}
