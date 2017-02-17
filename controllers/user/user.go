package user

import (
	"github.com/astaxie/beego"
)

type User struct {
	beego.Controller
}

func (this *User) Login() {

}

// func (this *User) Register() {
// 	this.Data["vueVersion"] = 1
// }

func (this *User) Forgetpassword() {

}

func (this *User) Logut() {
	sess := this.StartSession()
	err := sess.Delete("uid")
	this.Ctx.SetCookie("uid", "")
	if err == nil {
		this.Ctx.Redirect(302, "/user/login")
	}
}
