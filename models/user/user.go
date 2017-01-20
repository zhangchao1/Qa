package user

import (
	"github.com/astaxie/beego/orm"
)

type User struct {
	Uid           int64  `orm:"column(Uid);"`
	Name          string `orm:"column(Name);"`
	Email         string `orm:"column(Email);"`
	Salt          string `orm:"column(Salt);"`
	Password      string `orm:"column(Password);"`
	Age           int64  `orm:"column(Age);"`
	Sex           string `orm:"column(Sex);"`
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