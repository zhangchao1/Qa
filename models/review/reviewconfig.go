package review

import (
	"github.com/astaxie/beego/orm"
)

type ReviewConfig struct {
	Id         int64  `orm:"column(Id);"`
	Types      int    `orm:"column(Types);"`
	Scene      string `orm:"column(Scene);"`
	Role       int64  `orm:"column(Role);"`
	Eid        int64  `orm:"column(Eid);"`
	Process    int    `orm:"column(Process);"`
	EndEid     int64  `orm:"column(EndEid);"`
	EndProcess int    `orm:"column(EndProcess);"`
	EndUid     int64  `orm:"column(EndUid);"`
	Created    string `orm:"column(Created);"`
	Updated    string `orm:"column(Updated);"`
}

func (this *ReviewConfig) TableName() string {
	return "reviewconfig"
}

func init() {
	orm.RegisterModel(new(ReviewConfig))
}

func (this *ReviewConfig) GetReviewProcess(role int64, types int, scene string, eid int64) (ReviewConfig, error) {
	o := orm.NewOrm()
	reviewconfig := ReviewConfig{Role: role, Types: types, Scene: scene, Eid: eid}
	err := o.Read(&reviewconfig, "Role", "Types", "Scene", "Eid")
	return reviewconfig, err
}
