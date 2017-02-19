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

func (this *Account) Edit() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "account"
}

func (this *Account) Uploadavatar() {
	this.Data["vueVersion"] = 1
	this.Data["controllerName"] = "account"
}

func (this *Account) ChangePassword() {
	this.Data["vueVersion"] = 1
	UserId := this.GetUid()
	this.Data["uid"] = UserId
	this.Data["controllerName"] = "account"
}
