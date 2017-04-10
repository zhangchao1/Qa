package api

import (
	"Qa/models/review"
	"Qa/service/qa"
)

type Review struct {
	ControllerBase
}

// @router /cancel [get]
func (this *Review) Cancel() {
	var reviewService qa.ReviewService
	reviewStatusId, _ := this.GetInt64("reId")
	types := this.GetString("types")
	if reviewStatusId == 0 || types == "" {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		err := reviewService.Cancel(reviewStatusId, types)
		if err == nil {
			this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "取消成功"}
		} else {
			this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "系统错误"}
		}
		this.ServeJSON()
	}
}

// @router /list [get]
func (this *Review) List() {
	startIndex, _ := this.GetInt64("start")
	maxCounts, _ := this.GetInt64("max")
	types := this.GetString("types")
	status, _ := this.GetInt("status")
	if startIndex == 0 || maxCounts == 0 || types == "" || status == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		var reviewPerson review.ReviewPerson
		uid := this.GetUid()
		result := reviewPerson.List(startIndex, maxCounts, uid, types, status)
		var data []map[string]interface{}
		for _, value := range result.Datas {
			approveUid, _ := value["Uid"].(int64)
			reviewType, _ := value["Type"].(string)
			var reviewTypes string
			switch reviewType {
			case "leave":
				reviewTypes = "请假申请"
			case "travel":
				reviewTypes = "外勤申请"
			case "overtime":
				reviewTypes = "加班申请"
			case "expense":
				reviewTypes = "报销申请"
			case "goods":
				reviewTypes = "物品申请"
			}
			userinfo := this.GetUserInfoByUid(approveUid)
			value["UserName"] = userinfo.UserName
			value["Job"] = userinfo.Job
			value["Type"] = reviewTypes
			data = append(data, value)
		}
		this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "Datas": result}
		this.ServeJSON()
	}
}

// @router /approve [get]
func (this *Review) Approve() {
	var reviewService qa.ReviewService
	id, _ := this.GetInt64("id")
	reviewId, _ := this.GetInt64("reviewId")
	types := this.GetString("types")
	uid, _ := this.GetInt64("uid")
	level, _ := this.GetInt("level")
	detail := this.GetString("detail")
	if id == 0 || reviewId == 0 || level == 0 || types == "" || detail == "" || uid == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		errApprove := reviewService.Approve(reviewId, id, level, types, detail, uid)
		if errApprove == nil {
			this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "审核通过成功！"}
		} else {
			this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "系统错误！"}
		}
		this.ServeJSON()
	}
}

// @router /refuse [get]
func (this *Review) Refuse() {
	var reviewService qa.ReviewService
	id, _ := this.GetInt64("id")
	reviewId, _ := this.GetInt64("reviewId")
	level, _ := this.GetInt("level")
	detail := this.GetString("detail")
	types := this.GetString("types")
	if id == 0 || reviewId == 0 || level == 0 || detail == "" || types == "" {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		errRefuse := reviewService.Reject(id, reviewId, detail, level, types)
		if errRefuse == nil {
			this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "审核通过成功！"}
		} else {
			this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "系统错误！"}
		}
		this.ServeJSON()
	}
}

// @router /nodelist [get]
func (this *Review) NodeList() {
	reviewId, _ := this.GetInt64("reviewId")
	types := this.GetString("types")
	if reviewId == 0 || types == "" {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		var reviewNode review.ReviewNode
		result := reviewNode.GetReviewNodeByreviewStatusId(reviewId, types)
		this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "Datas": result}
		this.ServeJSON()
	}
}
