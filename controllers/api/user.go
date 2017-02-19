package api

import (
	"Qa/library/base"
	"Qa/library/scrypt"
	"Qa/models/user"
	"Qa/service/qa"
	"crypto/md5"
	"encoding/base64"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"github.com/astaxie/beego"
	"os"
	"strconv"
	"strings"
	"time"
)

type User struct {
	beego.Controller
}

type Image struct {
	Avatar string
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
				fmt.Println(nowUnix, searchUser.Id)
				passValue := fmt.Sprintf("%d,%d", searchUser.Id, nowUnix)
				token := baseEncode.Encode([]byte(passValue))
				this.Ctx.SetCookie("uid", string(token), 3600*24*7, "/")
			}
			this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": ""}
			this.ServeJSON()
		}
	}
}

// @router /saveavatar [post]
func (this *User) SaveAvatar() {
	var avatar Image
	json.Unmarshal(this.Ctx.Input.RequestBody, &avatar)
	if avatar.Avatar == "" {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "文件为空"}
		this.ServeJSON()
	} else {
		b64data := strings.Split(avatar.Avatar, "base64,")[1]
		dist, err := base64.StdEncoding.DecodeString(b64data)
		fmt.Println(dist, err)
		if err != nil {
			this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "文件无效"}
			this.ServeJSON()
		} else {
			nowTime := fmt.Sprintf("%d", time.Now().Unix())
			md5Ctx := md5.New()
			md5Ctx.Write([]byte(nowTime))
			cipherStr := md5Ctx.Sum(nil)
			filename := hex.EncodeToString(cipherStr) + ".jpg"
			filepath := "static/img/user/" + filename
			userAvatar := "http://localhost:8087/" + filepath
			f, _ := os.OpenFile(filepath, os.O_RDWR|os.O_CREATE, os.ModePerm)
			defer f.Close()
			fmt.Println(err)
			_, err := f.Write(dist)
			if err != nil {
				this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "系统错误"}
				this.ServeJSON()
			} else {
				sess := this.StartSession()
				Uid := sess.Get("uid")
				var uid int64
				var baseEncode base.BaseEncodePass
				if Uid == nil {
					token := this.Ctx.GetCookie("uid")
					src, _ := baseEncode.Decode([]byte(token))
					cookieInfo := strings.Split(string(src), ",")
					uid, _ = strconv.ParseInt(cookieInfo[0], 10, 64)
				} else {
					uid = Uid.(int64)
				}
				var userService qa.UserService
				result := userService.EditUserAvatar(uid, userAvatar)
				this.Data["json"] = result
				this.ServeJSON()
			}

		}
	}
}
