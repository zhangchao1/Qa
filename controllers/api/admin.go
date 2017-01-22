package api

import (
	"Qa/models/user"
	"Qa/service/qa"
	"encoding/json"
)

type Admin struct {
	ControllerBase
}

// @router /alldeparment [get]
func (this *Admin) AllDeparment() {
	var adminservice qa.AdminService
	var Data qa.Alldes
	adminservice.GetAllDeparment(0, &Data)
	this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "Data": Data.Children}
	this.ServeJSON()
}

// @router /creatuser [post]
func (this *Admin) CreatUser() {
	var addUser qa.CreatUser
	var adminService qa.AdminService
	json.Unmarshal(this.Ctx.Input.RequestBody, &addUser)
	result := adminService.AddUser(addUser)
	this.Data["json"] = result
	this.ServeJSON()
}

// @router /getuser [get]
func (this *Admin) GetUser() {
	var adminService qa.AdminService
	uid, _ := this.GetInt64("uid")
	if uid == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		result, err := adminService.GetEditUser(uid)
		if err != nil {
			this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "错误的用户id"}
			this.ServeJSON()
		} else {
			this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "Data": result}
			this.ServeJSON()
		}
	}
}

// @router /checkname [get]
func (this *Admin) CheckName() {
	var userGet user.User
	name := this.GetString("name")
	if name == "" {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		_, err := userGet.GetUserByName(name)
		if err != nil {
			this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": ""}
		} else {
			this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "该用户名已经存在"}
		}
		this.ServeJSON()
	}
}
