package attendance

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type Attendance struct {
	Id      int64  `orm:"column(Id);"`
	Uid     int64  `orm:"column(Guid);"`
	Status  string `orm:"column(Types);"`
	Ip      int64  `orm:"column(Count);"`
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
	attendance.Created = time.Now().Format("2006-01-02 15:04:05")
	attendance.Updated = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(attendance)
	return id, err
}

func (this *Attendance) UpdateAttendance(id int64) error {
	o := orm.NewOrm()
	o.Using("Qa")
	attendance := Attendance{Id: id}
	err := o.Read(&attendance)
	if err == nil {
		attendance.Created = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&attendance, "Updated")
		return err
	}
	return err
}
