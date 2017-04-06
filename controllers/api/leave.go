package api

import (
	"Qa/models/leave"
	"Qa/service/qa"
	"encoding/json"
	"io"
	"os"
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
