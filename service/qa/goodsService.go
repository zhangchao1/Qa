package qa

import (
	"Qa/models/goods"
	"Qa/service/redisService"
	"Qa/validator"
	"fmt"
	"github.com/astaxie/beego/validation"
)

type GoodsService struct {
}

const LIFE_GOODS = "生活物品"
const OFFICIAL_GOODS = "普通办公物品"
const ELEC_GOODS = "电子办公物品"
const PRECIOUS_GOODS = "贵重的办公物品"

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

func (this *GoodsService) Add(addGoods goods.Goods) SaveResult {
	var result SaveResult
	var good goods.Goods
	var goodsDetail goods.GoodsDetail
	var userRedis redisService.UserRedisService
	valid := validation.Validation{}
	val := validator.GoodSValidation{
		Application:     addGoods.Application,
		ApplyTotalCount: addGoods.ApplyTotalCount,
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
		isSurplus, item := goodsDetail.CheckIsSurplus(addGoods.GoodsDetailId, addGoods.ApplyTotalCount)
		if isSurplus == -1 {
			result.ErrMsg = "该物品不存在！"
			result.IsSuccess = false
		} else if isSurplus == -2 {
			result.ErrMsg = "该物品不存在！"
			result.IsSuccess = false
		} else {
			if item.Type == ELEC_GOODS || item.Type == PRECIOUS_GOODS {
				addGoods.IsBack = 1
			}
			goodsId, err := good.Add(addGoods)
			if err != nil {
				result.ErrMsg = "系统错误"
				result.IsSuccess = false
			} else {
				userInfo := userRedis.GetUserInfo(addGoods.Uid)
				var reviewService ReviewService
				var goodReviewType int
				if item.Type == PRECIOUS_GOODS {
					goodReviewType = 4
				} else if item.Type == ELEC_GOODS {
					goodReviewType = 3
				} else if item.Type == OFFICIAL_GOODS {
					goodReviewType = 2
				} else {
					goodReviewType = 1
				}
				errSaveReview := reviewService.Add(goodsId, addGoods.Uid, userInfo.Role, userInfo.Did, goodReviewType, "goods", addGoods.Application)
				fmt.Println(errSaveReview)
				if errSaveReview != nil {
					result.ErrMsg = "系统错误"
					result.IsSuccess = false
				} else {
					result.ErrMsg = "申请成功！"
					result.IsSuccess = true
				}
			}
		}
	}
	return result
}
