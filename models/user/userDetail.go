package user

import (
	"fmt"
	"github.com/astaxie/beego/orm"
	"time"
)

type UserDetail struct {
	Id       int64  `orm:"column(Id);"`
	Uid      int64  `orm:"column(Uid);"`
	Habit    string `orm:"column(Habit);"`
	Motto    string `orm:"column(Motto);"`
	Eduction string `orm:"column(Eduction);"`
	Skill    string `orm:"column(Skill);"`
	Location string `orm:"column(Location);"`
	PhoneNum string `orm:"column(PhoneNum);"`
	Birthday string `orm:"column(Birthday);"`
	Created  string `orm:"column(Created);"`
	Updated  string `orm:"column(Updated);"`
}

func (this *UserDetail) TableName() string {
	return "userdetail"
}

func init() {
	orm.RegisterModel(new(UserDetail))
}

func (this *UserDetail) AddUserDetail(addItem UserDetail) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	userdetail := new(UserDetail)
	userdetail.Uid = addItem.Uid
	userdetail.Skill = addItem.Skill
	userdetail.Habit = addItem.Habit
	userdetail.PhoneNum = addItem.PhoneNum
	userdetail.Location = addItem.Location
	userdetail.Eduction = addItem.Eduction
	userdetail.Motto = addItem.Motto
	userdetail.Birthday = addItem.Birthday
	userdetail.Updated = time.Now().Format("2006-01-02 15:04:05")
	userdetail.Created = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(userdetail)
	return id, err
}

func (this *UserDetail) GetUserDetailByUid(uid int64) (UserDetail, error) {
	o := orm.NewOrm()
	userdetail := UserDetail{Uid: uid}
	err := o.Read(&userdetail, "Uid")
	fmt.Println(err)
	return userdetail, err
}
func (this *UserDetail) EditUserDetail(uid int64, editItem UserDetail) error {
	o := orm.NewOrm()
	o.Using("Qa")
	userdetail := UserDetail{Uid: uid}
	err := o.Read(&userdetail, "Uid")
	if err == nil {
		userdetail.Skill = editItem.Skill
		userdetail.Habit = editItem.Habit
		userdetail.PhoneNum = editItem.PhoneNum
		userdetail.Location = editItem.Location
		userdetail.Eduction = editItem.Eduction
		userdetail.Motto = editItem.Motto
		userdetail.Birthday = editItem.Birthday
		userdetail.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&userdetail, "Skill", "Habit", "PhoneNum", "Location", "Eduction", "Motto", "Birthday", "Updated")
		return err
	}
	return err
}
