package reimbursement

import (
	"Qa/controllers"
)

type Reimbursement struct {
	controllers.ControllerBase
}

func (this *Reimbursement) Add() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "reimbursement"
}

func (this *Reimbursement) Record() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "reimbursement"
}
