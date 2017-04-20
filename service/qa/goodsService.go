package qa

import (
	"Qa/models/goods"
	"Qa/validator"
	"fmt"
	"github.com/astaxie/beego/validation"
)

type GoodsService struct {
}

func (this *GoodsService) AddGoodsDetail(addGoodsDetail goods.GoodsDetail) SaveResult {
	var result SaveResult
	var goodsDetail goods.GoodsDetail
	valid := validation.Validation{}
	val := validator.GoodSDetailValidation{
		Name:       addGoodsDetail.Name,
		Type:       addGoodsDetail.Type,
		TotalCount: addGoodsDetail.TotalCount,
		Unit:       addGoodsDetail.Unit,
	}
	is, err := valid.Valid(&val)
	if err != nil {
		result.ErrMsg = "传入正确的参数"
		result.IsSuccess = false
	} else if !is {
		for _, err := range valid.Errors {
			result.ErrMsg = fmt.Sprintf("%s:%s", err.Key, err.Message)
		}
		result.IsSuccess = false
	} else {
		_, err := goodsDetail.Add(addGoodsDetail)
		if err != nil {
			result.ErrMsg = "系统错误"
			result.IsSuccess = false
		} else {
			result.ErrMsg = "申请成功！"
			result.IsSuccess = true
		}
	}
	return result
}
