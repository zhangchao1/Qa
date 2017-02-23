package user

import (
	"fmt"
	"github.com/astaxie/beego/orm"
	"math"
	"time"
)

type User struct {
	Id            int64  `orm:"column(Uid);"`
	Name          string `orm:"column(Name);"`
	UserName      string `orm:"column(UserName);"`
	Email         string `orm:"column(Email);"`
	Head          int64  `orm:"column(Head);"`
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

const query_all_user = "select * from user as us left join employee as em on us.Uid = em.uid ORDER BY us.Updated desc Limit ?,?"
const all_user = "select username,uid from user"

func (this *User) TableName() string {
	return "user"
}

type Items struct {
	Datas []orm.Params
	Total int64
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
	user.Head = addItem.Head
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

func (this *User) GetAllUser() []orm.Params {
	o := orm.NewOrm()
	o.Using("Qa")
	var maps []orm.Params
	o.Raw(all_user).Values(&maps)
	return maps
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
		user.Head = editItem.Head
		user.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&user, "Name", "Email", "Age", "Sex", "Head", "Updated")
		return err
	}
	return err
}
func (this *User) EditAvatar(Uid int64, Avatar string) error {
	o := orm.NewOrm()
	o.Using("Qa")
	user := User{Id: Uid}
	err := o.Read(&user)
	if err == nil {
		user.Avatar = Avatar
		user.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&user, "Avatar", "Updated")
		return err
	}
	return err
}

func (this *User) UserList(start int64, max int64, orderBy string) Items {
	o := orm.NewOrm()
	o.Using("Qa")
	var maps []orm.Params
	var items Items
	var totalPage int64
	cnt, err := o.QueryTable("user").Count()
	if err != nil {
		cnt = 0
	}
	count := float64(cnt)
	maxCount := float64(max)
	pages := float64(count / maxCount)
	totalPage = int64(math.Ceil(pages))
	offset := (start - 1) * max
	limit := max
	o.Raw(query_all_user, offset, limit).Values(&maps)
	items.Datas = maps
	items.Total = totalPage
	fmt.Println(items)
	return items
}

func (this *User) EditUserPassword(Uid int64, salt string, password string) error {
	o := orm.NewOrm()
	o.Using("Qa")
	user := User{Id: Uid}
	err := o.Read(&user)
	if err == nil {
		user.Salt = salt
		user.Password = password
		user.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&user, "Salt", "Password", "Updated")
		return err
	}
	return err
}
