package goods

import (
	"fmt"
	"github.com/astaxie/beego/orm"
	"math"
	"time"
)

type GoodsDetail struct {
	Id         int64  `orm:"column(Id);"`
	Type       string `orm:"column(Type);"`
	Name       string `orm:"column(Name);"`
	Unit       string `orm:"column(Unit);"`
	TotalCount int    `orm:"column(TotalCount);"`
	Created    string `orm:"column(Created);"`
	Updated    string `orm:"column(Updated);"`
}
type Items struct {
	Datas []orm.Params
	Total int64
}

const QUERY_GoodsDetail_DETAIL = "select * from `goodsdetail` where Id = ?"

func (this *GoodsDetail) TableName() string {
	return "goodsdetail"
}

func init() {
	orm.RegisterModel(new(GoodsDetail))
}

func (this *GoodsDetail) Add(addItem GoodsDetail) (int64, error) {
	o := orm.NewOrm()
	o.Using("Qa")
	goodsdetail := new(GoodsDetail)
	goodsdetail.Name = addItem.Name
	goodsdetail.TotalCount = addItem.TotalCount
	goodsdetail.Type = addItem.Type
	goodsdetail.Unit = addItem.Unit
	goodsdetail.Updated = time.Now().Format("2006-01-02 15:04:05")
	goodsdetail.Created = time.Now().Format("2006-01-02 15:04:05")
	id, err := o.Insert(goodsdetail)
	return id, err
}

func (this *GoodsDetail) Edit(editItem GoodsDetail) error {
	o := orm.NewOrm()
	o.Using("Qa")
	goodsdetail := GoodsDetail{Id: editItem.Id}
	err := o.Read(&goodsdetail, "Id")
	if err == nil {
		goodsdetail.Name = editItem.Name
		goodsdetail.Type = editItem.Type
		goodsdetail.Unit = editItem.Unit
		goodsdetail.TotalCount = editItem.TotalCount
		goodsdetail.Updated = time.Now().Format("2006-01-02 15:04:05")
		_, err := o.Update(&goodsdetail, "Updated", "TotalCount", "Name", "Unit", "Type")
		return err
	}
	return err
}

func (this *GoodsDetail) Info(id int64) []orm.Params {
	o := orm.NewOrm()
	o.Using("Qa")
	var maps []orm.Params
	o.Raw(QUERY_GoodsDetail_DETAIL, id).Values(&maps)
	return maps
}

func (this *GoodsDetail) Delete(id int64) error {
	o := orm.NewOrm()
	o.Using("Qa")
	goodsdetail := GoodsDetail{Id: id}
	err := o.Read(&goodsdetail, "Id")
	if err == nil {
		_, err := o.Delete(&goodsdetail)
		return err
	}
	return err
}

func (this *GoodsDetail) List(start int64, max int64, orderBy string, keywords string) Items {
	o := orm.NewOrm()
	o.Using("Qa")
	var maps []orm.Params
	var items Items
	var totalPage int64
	var cnt int64
	var err error
	fmt.Println(keywords)
	if keywords == "" {
		cnt, err = o.QueryTable("goodsdetail").Count()
	} else {
		cnt, err = o.QueryTable("goodsdetail").Filter("Name__contains", keywords).Count()
	}
	if err != nil {
		cnt = 0
	}
	count := float64(cnt)
	maxCount := float64(max)
	pages := float64(count / maxCount)
	totalPage = int64(math.Ceil(pages))
	offset := (start - 1) * max
	limit := max
	if keywords == "" {
		o.QueryTable("goodsdetail").Limit(limit, offset).OrderBy(orderBy).Values(&maps)
	} else {
		o.QueryTable("goodsdetail").Filter("Name__contains", keywords).Limit(limit, offset).OrderBy(orderBy).Values(&maps)
	}
	items.Datas = maps
	items.Total = totalPage
	return items
}

func (this *GoodsDetail) All(orderBy string) []orm.Params {
	o := orm.NewOrm()
	o.Using("Qa")
	var maps []orm.Params
	o.QueryTable("goodsdetail").OrderBy(orderBy).Values(&maps)
	return maps
}

func (this *GoodsDetail) CheckIsSurplus(id int64, applyCount int) (status int, item GoodsDetail) {
	o := orm.NewOrm()
	o.Using("Qa")
	goodsdetail := GoodsDetail{Id: id}
	err := o.Read(&goodsdetail, "Id")
	fmt.Println(err, id)
	if err == nil {
		surplus := goodsdetail.TotalCount - applyCount
		if surplus < 0 {
			return -2, goodsdetail
		} else {
			return 0, goodsdetail
		}
	}
	return -1, goodsdetail
}
