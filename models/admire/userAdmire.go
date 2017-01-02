package admire

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type UserAdmire struct {
	Id      int64  `orm:"column(Id);"`
	Uid     int64  `orm:"column(Uid);"`
	Name    string `orm:"column(Name);"`
	Guid    int64  `orm:"column(Guid);"`
	Types   int64  `orm:"column(Types);"`
	Created string `orm:"column(Created);"`
}

func (m *UserAdmire) TableName() string {
	return "useradmire"
}

func init() {
	orm.RegisterModel(new(UserAdmire))
}

func (this *UserAdmire) AddUserAdmire(addItem UserAdmire) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	userAdmire := new(UserAdmire)
	userAdmire.Guid = addItem.Guid
	userAdmire.Name = addItem.Name
	userAdmire.Uid = addItem.Uid
	userAdmire.Types = addItem.Types
	userAdmire.Created = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(userAdmire)
	return id, err
}

func (this *UserAdmire) CancelAdmire(guid int64, uid int64, types int64) error {
	o := orm.NewOrm()
	o.Using("Qa")
	var cancelAdmire UserAdmire
	cancelAdmire = Admire{Guid: guid, Types: types, Uid: uid}
	_, err := o.Delete(cancelAdmire)
	return err
}
