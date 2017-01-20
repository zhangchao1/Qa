package api

import (
	"Qa/service/qa"
	"encoding/json"
)

type Admin struct {
	ControllerBase
}

type CreatUser struct {
	Did      int64
	Job      string
	Name     string
	Level    int64
	Role     string
	Managers int64
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
	var addUser CreatUser
	json.Unmarshal(this.Ctx.Input.RequestBody, &addUser)
	this.Data["json"] = addUser
	this.ServeJSON()
}
