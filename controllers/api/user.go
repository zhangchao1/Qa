package api

import (
	"Qa/library/scrypt"
	"Qa/models/user"
	"github.com/astaxie/beego"
	"rand"
	"strconv"
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
				Uid := strconv.FormatInt(searchUser.Id, 10)
				nowUnix := time.Now().Unix()
				expiration := time.Now().Add(7 * 24 * time.Hour)
				this.Ctx.SetCookie("uid", Uid, expiration)
			}
			this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": ""}
			this.ServeJSON()
		}
	}
}
