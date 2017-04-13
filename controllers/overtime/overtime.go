package overtime

import (
	"Qa/controllers"
	"Qa/models/review"
	"strconv"
)

type Overtime struct {
	controllers.ControllerBase
}

func (this *Overtime) Add() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "overtime"
}

func (this *Overtime) Record() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "overtime"
}

func (this *Overtime) My() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "overtime"
}

func (this *Overtime) Detail() {
	var id int64
	Params := make(map[string]string)
	Params = this.Ctx.Input.Params()
	id, _ = strconv.ParseInt(Params["0"], 10, 64)
	if id == 0 {
		return
	} else {
		this.Data["oid"] = id
		var reviewStatus review.ReviewStatus
		reviewStatusInfo := reviewStatus.GetReviewStatusByType("overtime", id)
		this.Data["reviewStatusId"] = reviewStatusInfo[0]["Id"]
		this.Data["vueVersion"] = 1
		this.Data["controllerName"] = "overtime"
	}
}
