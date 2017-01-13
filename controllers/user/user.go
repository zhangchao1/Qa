package user

import (
	"Qa/controllers"
)

type User struct {
	controllers.ControllerBase
}

func (this *User) Login() {
	this.Data["vueVersion"] = 1
}

func (this *User) Register() {
	this.Data["vueVersion"] = 1
}

func (this *User) Forgetpassword() {
	this.Data["vueVersion"] = 1
}
