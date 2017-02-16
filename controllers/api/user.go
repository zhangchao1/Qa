package api

import (
	"Qa/library/base"
	"Qa/library/scrypt"
	"Qa/models/user"
	"fmt"
	"github.com/astaxie/beego"
	"time"
)

type User struct {
	beego.Controller
}

// @router /login [post]
func (this *User) Login() {
	var search user.User
	var scrypt scrypt.Scrypt
	name := this.GetString("name")
	password := this.GetString("password")
	autologin, _ := this.GetBool("autologin")
	if password == "" || name == "" {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "用户名或者密码为空"}
		this.ServeJSON()
	} else {
		searchUser, errName := search.GetUserByName(name)
		if errName != nil {
			this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "用户名无效"}
			this.ServeJSON()
		}
		confirmPassHash := scrypt.StringHash(password, searchUser.Salt, 32)
		errPassword := scrypt.CompareHash([]byte(confirmPassHash), []byte(searchUser.Password))
		if !errPassword {
			this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "密码错误"}
			this.ServeJSON()
		} else {
			sess := this.StartSession()
			sess.Set("uid", searchUser.Id)
			if autologin {
				var baseEncode base.BaseEncodePass
				nowUnix := time.Now().Unix()
				passValue := fmt.Sprintf("%d,%d", searchUser.Id, nowUnix)
				token := baseEncode.Encode([]byte(passValue))
				expiration := time.Now().Add(7 * 24 * time.Hour)
				this.Ctx.SetCookie("uid", string(token), expiration)
			}
			this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": ""}
			this.ServeJSON()
		}
	}
}
