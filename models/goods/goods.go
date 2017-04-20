package goods

import (
	"github.com/astaxie/beego/orm"
	"reflect"
	"time"
)

type Goods struct {
	Id              int64  `orm:"column(Id);"`
	Uid             int64  `orm:"column(Uid);"`
	Application     string `orm:"column(Application);"`
	ApplyTotalCount int    `orm:"column(ApplyTotalCount);"`
	IsBack          int    `orm:"column(IsBack);"`
	GoodsDetailId   int64  `orm:"column(GoodSDetailId);"`
	Created         string `orm:"column(Created);"`
	Updated         string `orm:"column(Updated);"`
}

func (this *Goods) TableName() string {
	return "goods"
}

func init() {
	orm.RegisterModel(new(Goods))
}

func (this *Goods) Add(addItem Goods) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	goods := new(Goods)
	goods.Uid = addItem.Uid
	goods.Application = addItem.Application
	goods.ApplyTotalCount = addItem.ApplyTotalCount
	goods.GoodsDetailId = addItem.GoodsDetailId
	good := reflect.ValueOf(addItem)
	IsBack := good.FieldByName("IsBack").Int()
	if IsBack != 0 {
		goods.IsBack = addItem.IsBack
	}
	goods.Updated = time.Now().Format("2006-01-02 15:04:05")
	goods.Created = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(goods)
	return id, err
}
