package user

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type Employee struct {
	Id      int64  `orm:"column(Eid);"`
	Uid     int64  `orm:"column(Uid);"`
	DeId    int64  `orm:"column(DeId);"`
	Job     string `orm:"column(Job);"`
	Level   int    `orm:"column(Level);"`
	Role    int64  `orm:"column(Role);"`
	Manager int    `orm:"column(Manager);"`
	Created string `orm:"column(Created);"`
	Updated string `orm:"column(Updated);"`
}

func (this *Employee) TableName() string {
	return "employee"
}

func init() {
	orm.RegisterModel(new(Employee))
}

func (this *Employee) AddEmployee(addItem Employee) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	employee := new(Employee)
	employee.DeId = addItem.DeId
	employee.Job = addItem.Job
	employee.Level = addItem.Level
	employee.Manager = addItem.Manager
	employee.Uid = addItem.Uid
	employee.Role = addItem.Role
	employee.Updated = time.Now().Format("2006-01-02 15:04:05")
	employee.Created = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(employee)
	return id, err
}

func (this *Employee) EditEmployee(uid int64, editItem Employee) error {
	o := orm.NewOrm()
	o.Using("Qa")
	employee := Employee{Uid: uid}
	err := o.Read(&employee, "Uid")
	if err == nil {
		employee.DeId = editItem.DeId
		employee.Job = editItem.Job
		employee.Level = editItem.Level
		employee.Manager = editItem.Manager
		employee.Role = editItem.Role
		employee.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&employee, "DeId", "Job", "Level", "Manager", "Role", "Updated")
		return err
	}
	return err
}
func (this *Employee) GetEmployeeByUid(uid int64) (Employee, error) {
	o := orm.NewOrm()
	employee := Employee{Uid: uid}
	err := o.Read(&employee, "Uid")
	return employee, err
}
