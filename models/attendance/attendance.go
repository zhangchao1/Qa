package attendance

import (
	"fmt"
	"github.com/astaxie/beego/orm"
)

type Attendance struct {
	Id      int64  `orm:"column(Id);"`
	Uid     int64  `orm:"column(Uid);"`
	Status  int    `orm:"column(Status);"`
	Ip      string `orm:"column(Ip);"`
	Updated string `orm:"column(Updated);"`
	Created string `orm:"column(Created);"`
}

func (this *Attendance) TableName() string {
	return "attendance"
}

func init() {
	orm.RegisterModel(new(Attendance))
}

func (this *Attendance) AddAttendance(addItem Attendance) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	attendance := new(Attendance)
	attendance.Uid = addItem.Uid
	attendance.Ip = addItem.Ip
	attendance.Status = addItem.Status
	attendance.Created = addItem.Created
	attendance.Updated = addItem.Created
	id, err := o.Insert(attendance)
	return id, err
}

func (this *Attendance) UpdateAttendance(id int64, addtime string, status int, ip string) error {
	o := orm.NewOrm()
	o.Using("Qa")
	attendance := Attendance{Id: id}
	err := o.Read(&attendance)
	if err == nil {
		attendance.Updated = addtime
		attendance.Status = status
		attendance.Ip = ip
		_, err := o.Update(&attendance, "Updated", "Status", "Ip")
		return err
	}
	return err
}

func (this *Attendance) GetUserDayAttendanceInfo(uid int64, startTime string, endTime string) []orm.Params {
	o := orm.NewOrm()
	o.Using("Qa")
	var maps []orm.Params
	fmt.Println(uid, startTime, endTime)
	o.QueryTable("attendance").Filter("Uid", uid).Values(&maps)
	return maps
}
