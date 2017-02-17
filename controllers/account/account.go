package account

import (
	"Qa/controllers"
)

type Account struct {
	controllers.ControllerBase
}

func (this *Account) Center() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "account"
}

func (this *Account) Detail() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "account"
}

func (this *Account) Setting() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "account"
}
