package admire

import (
	"github.com/astaxie/beego/orm"
	"time"
)

type Admire struct {
	Id      int64  `orm:"column(Id);"`
	Guid    int64  `orm:"column(Guid);"`
	Types   int64  `orm:"column(Types);"`
	Count   int64  `orm:"column(Count);"`
	Updated string `orm:"column(Updated);"`
	Created string `orm:"column(Created);"`
}

func (this *Admire) TableName() string {
	return "admire"
}

func init() {
	orm.RegisterModel(new(Admire))
}

func (this *Admire) AddAdmire(addItem Admire) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	admire := new(Admire)
	admire.Guid = addItem.Guid
	admire.Types = addItem.Types
	admire.Count = addItem.Count
	admire.Created = time.Now().Format("2006-01-02 15:04:05")
	admire.Updated = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(admire)
	return id, err
}

func (this *Admire) UpdateAdmire(Guid int64, Types int64) error {
	o := orm.NewOrm()
	o.Using("Qa")
	updateAdmire := Admire{Guid: Guid, Types: Types}
	err := o.Read(&updateAdmire, "Guid", "Types")
	if err == nil {
		updateAdmire.Count = updateAdmire.Count + 1
		updateAdmire.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&updateAdmire, "Count", "Updated")
		return err
	}
	return err
}

func (this *Admire) GetAdmireByGuidAndTypes(Guid int64, Types int64) (Admire, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	updateAdmire := Admire{Guid: Guid, Types: Types}
	err := o.Read(&updateAdmire, "Guid", "Types")
	return updateAdmire, err
}
