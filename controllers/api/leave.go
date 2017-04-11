package api

import (
	"Qa/models/leave"
	"Qa/service/qa"
	"encoding/json"
	"io"
	"os"
	"strconv"
)

type Leave struct {
	ControllerBase
}

// @router /upload [post]
func (this *Leave) Upload() {
	files, err := this.GetFiles("upload_logo")
	var imgUrl string
	if err != nil {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "系统错误"}
		this.ServeJSON()
	} else {
		for i, _ := range files {
			file, err := files[i].Open()
			defer file.Close()
			if err != nil {
				this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "系统错误"}
				this.ServeJSON()
			} else {
				filename := getFileName(files[i].Filename)
				dstdir, err := os.Create("static/img/leave/" + filename)
				if err != nil {
					this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "系统错误"}
					this.ServeJSON()
				} else {
					_, err := io.Copy(dstdir, file)
					dstdir.Close()
					if err != nil {
						this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "系统错误"}
						this.ServeJSON()
					} else {
						imgUrl = "http://localhost:8087/static/img/leave/" + filename
					}
				}
			}
		}
		this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "上传成功", "Data": imgUrl}
		this.ServeJSON()
	}
}

// @router /add [post]
func (this *Leave) Add() {
	var leave leave.Leave
	json.Unmarshal(this.Ctx.Input.RequestBody, &leave)
	leave.Uid = this.GetUid()
	var leaveService qa.LeaveService
	result := leaveService.Add(leave)
	this.Data["json"] = result
	this.ServeJSON()
}

// @router /leaveList [get]
func (this *Leave) LeaveList() {
	var leave leave.Leave
	startIndex, _ := this.GetInt64("start")
	maxCounts, _ := this.GetInt64("max")
	status, _ := this.GetInt("status")
	if startIndex == 0 || maxCounts == 0 || status == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		uid := this.GetUid()
		result := leave.GetLeaveByStatus(startIndex, maxCounts, status, uid)
		this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "data": result}
		this.ServeJSON()
	}
}

// @router /detail [get]
func (this *Leave) Detail() {
	var leave leave.Leave
	id, _ := this.GetInt64("id")
	if id == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		result := leave.Detail(id)
		for _, value := range result {
			Uid, _ := value["Uid"].(string)
			leaveUid, _ := strconv.ParseInt(Uid, 14, 64)
			userinfo := this.GetUserInfoByUid(leaveUid)
			value["UserName"] = userinfo.UserName
			value["Name"] = userinfo.Name
		}
		this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "data": result}
		this.ServeJSON()
	}
}
