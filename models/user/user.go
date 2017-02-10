package user

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type User struct {
	Id            int64  `orm:"column(Uid);"`
	Name          string `orm:"column(Name);"`
	UserName      string `orm:"column(UserName);"`
	Email         string `orm:"column(Email);"`
	Salt          string `orm:"column(Salt);"`
	Password      string `orm:"column(Password);"`
	Age           int    `orm:"column(Age);"`
	Sex           int    `orm:"column(Sex);"`
	Avatar        string `orm:"column(Avatar);"`
	LastLoginIp   string `orm:"column(LastLoginIp);"`
	ReLoginIp     string `orm:"column(ReLoginIp);"`
	ReLoginTime   string `orm:"column(ReLoginTime);"`
	LastLoginTime string `orm:"column(LastLoginTime);"`
	Created       string `orm:"column(Created);"`
	Updated       string `orm:"column(Updated);"`
}

func (this *User) TableName() string {
	return "user"
}

func init() {
	orm.RegisterModel(new(User))
}

func (this *User) AddUser(addItem User) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	user := new(User)
	user.Name = addItem.Name
	user.UserName = addItem.UserName
	user.Email = addItem.Email
	user.Salt = addItem.Salt
	user.Password = addItem.Password
	user.Age = addItem.Age
	user.Sex = addItem.Sex
	user.Avatar = addItem.Avatar
	user.Updated = time.Now().Format("2006-01-02 15:04:05")
	user.Created = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(user)
	return id, err
}

func (this *User) GetUserByUid(uid int64) (item User, err error) {
	o := orm.NewOrm()
	user := User{Id: uid}
	err = o.Read(&user, "Id")
	return user, err
}

func (this *User) GetUserByName(name string) (item User, err error) {
	o := orm.NewOrm()
	user := User{Name: name}
	err = o.Read(&user, "Name")
	return user, err
}

func (this *User) GetUserByUserName(userName string) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	cnt, err := o.QueryTable("user").Filter("UserName", userName).Count()
	return cnt, err
}

func (this *User) EditUser(Uid int64, editItem User) error {
	o := orm.NewOrm()
	o.Using("Qa")
	user := User{Id: Uid}
	err := o.Read(&user)
	if err == nil {
		user.Age = editItem.Age
		user.Sex = editItem.Sex
		user.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&user, "Name", "Email", "Age", "Sex", "Updated")
		return err
	}
	return err
}
