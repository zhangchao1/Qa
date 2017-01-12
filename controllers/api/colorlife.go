package api

import (
	"Qa/models/colorlife"
	"Qa/service/qa"
	"crypto/md5"
	"encoding/hex"
	"encoding/json"
	"fmt"
	"io"
	"os"
	"time"
)

type ColorLife struct {
	ControllerBase
}

// @router /upload [post]
func (this *ColorLife) Upload() {
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
				dstdir, err := os.Create("static/img/colorlife/" + filename)
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
						imgUrl = "http://localhost:8087/static/img/colorlife/" + filename
					}
				}
			}
		}
		this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "上传成功", "Data": imgUrl}
		this.ServeJSON()
	}
}

func getFileName(name string) string {
	nowTime := fmt.Sprintf("%d", time.Now().Unix())
	fileHash := nowTime + name
	md5Ctx := md5.New()
	md5Ctx.Write([]byte(fileHash))
	cipherStr := md5Ctx.Sum(nil)
	filename := hex.EncodeToString(cipherStr) + ".jpg"
	return filename
}

// @router /add [post]
func (this *ColorLife) Add() {
	var addcolorlife colorlife.Colorlife
	json.Unmarshal(this.Ctx.Input.RequestBody, &addcolorlife)
	var colorlifeService qa.ColorlifeService
	result := colorlifeService.Add(addcolorlife)
	fmt.Println(result)
	this.Data["json"] = result
	this.ServeJSON()
}
