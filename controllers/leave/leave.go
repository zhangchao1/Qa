package leave

import (
	"Qa/controllers"
	"Qa/models/review"
	"strconv"
)

type Leave struct {
	controllers.ControllerBase
}

func (this *Leave) My() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "leave"
}

func (this *Leave) Record() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "leave"
}

func (this *Leave) Add() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "leave"
}

func (this *Leave) Detail() {
	var id int64
	Params := make(map[string]string)
	Params = this.Ctx.Input.Params()
	id, _ = strconv.ParseInt(Params["0"], 10, 64)
	if id == 0 {
		return
	} else {
		this.Data["rid"] = id
		var reviewStatus review.ReviewStatus
		reviewStatusInfo := reviewStatus.GetReviewStatusByType("leave", id)
		this.Data["reviewStatusId"] = reviewStatusInfo[0]["Id"]
		this.Data["vueVersion"] = 1
		this.Data["controllerName"] = "leave"
	}
}
