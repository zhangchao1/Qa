package api

import (
	"Qa/models/user"
	"Qa/service/qa"
	"encoding/json"
	"fmt"
	"strconv"
)

type Admin struct {
	ControllerBase
}

type UserDatas struct {
	Uid      int64
	UserName string
	Updated  string
	Job      string
	Role     string
}

type AllDatas struct {
	Datas []UserDatas
	Total int64
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
			this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "用户名已经存在"}
		}
		this.ServeJSON()
	}
}

// @router /edituser [post]
func (this *Admin) EditUser() {
	var editUser qa.EditUser
	var adminService qa.AdminService
	json.Unmarshal(this.Ctx.Input.RequestBody, &editUser)
	result := adminService.EditUser(editUser)
	this.Data["json"] = result
	this.ServeJSON()
}

// @router /userlist [get]
func (this *Admin) UserList() {
	var users user.User
	var results AllDatas
	startIndex, _ := this.GetInt64("start")
	maxCounts, _ := this.GetInt64("max")
	if startIndex == 0 || maxCounts == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		datas := users.UserList(startIndex, maxCounts, "-Updated")
		results.Total = datas.Total
		var Items []UserDatas
		for _, v := range datas.Datas {
			var item UserDatas
			fmt.Println(v)
			Uid, _ := v["Uid"].(string)
			fmt.Println(Uid)
			UserName, _ := v["UserName"].(string)
			Updated, _ := v["Updated"].(string)
			Job, _ := v["Job"].(string)
			Role, _ := v["Role"].(string)
			item.Uid, _ = strconv.ParseInt(Uid, 10, 64)
			item.UserName = UserName
			item.Updated = Updated
			item.Job = Job
			item.Role = Role
			Items = append(Items, item)
		}
		results.Datas = Items
		this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "data": results}
		this.ServeJSON()
	}
}

// @router /updatepassword [post]
func (this *Admin) UpdatePassword() {
	var editUpdatePawword qa.UpdatePassword
	var adminService qa.AdminService
	json.Unmarshal(this.Ctx.Input.RequestBody, &editUpdatePawword)
	result := adminService.UpdatePassword(editUpdatePawword)
	this.Data["json"] = result
	this.ServeJSON()
}

// @router /alluser [get]
func (this *Admin) AllUser() {
	var get user.User
	info := get.GetAllUser()
	this.Data["json"] = map[string]interface{}{"IsSuccess": true, "Data": info}
	this.ServeJSON()
}
