package api

import (
	"Qa/models/colorlife"
	"Qa/models/comment"
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

// @router /edit [post]
func (this *ColorLife) Edit() {
	var editcolorlife colorlife.Colorlife
	json.Unmarshal(this.Ctx.Input.RequestBody, &editcolorlife)
	var colorlifeService qa.ColorlifeService
	result := colorlifeService.Edit(editcolorlife)
	fmt.Println(result)
	this.Data["json"] = result
	this.ServeJSON()
}

// @router /getcolorlife [get]
func (this *ColorLife) GetColorlife() {
	var colorlifeService qa.ColorlifeService
	id, _ := this.GetInt64("id")
	if id == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		data, err := colorlifeService.GetColorlifeByCid(id, 1)
		fmt.Println(err)
		if err != nil {
			this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "无效的id"}
			this.ServeJSON()
		} else {
			this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "data": data}
			this.ServeJSON()
		}
	}
}

// @router /admire [get]
func (this *ColorLife) AdmireColorLife() {
	var colorlifeService qa.ColorlifeService
	id, _ := this.GetInt64("id")
	if id == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		result := colorlifeService.AddAdmrie(id)
		this.Data["json"] = result
		this.ServeJSON()
	}
}

// @router /admirestatus [get]
func (this *ColorLife) UserAdmireStatus() {
	var colorlifeService qa.ColorlifeService
	id, _ := this.GetInt64("id")
	if id == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		result := colorlifeService.UserAdmireStatus(id, 1)
		this.Data["json"] = result
		this.ServeJSON()
	}
}

// @router /addcomment [post]
func (this *ColorLife) AddComment() {
	var colorlifeService qa.ColorlifeService
	var addComment comment.Comment
	json.Unmarshal(this.Ctx.Input.RequestBody, &addComment)
	addComment.Types = 2
	addComment.Uid = 1
	addComment.TargetUid = 2
	result := colorlifeService.AddColorlifeComment(addComment)
	fmt.Println(result)
	this.Data["json"] = result
	this.ServeJSON()
}

// @router /commentlist [get]
func (this *ColorLife) ColorLifeCommentList() {
	var Comment comment.Comment
	var result comment.Items
	id, _ := this.GetInt64("id")
	startIndex, _ := this.GetInt64("start")
	maxCounts, _ := this.GetInt64("max")
	if startIndex == 0 || maxCounts == 0 || id == 0 {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "请传递正确的参数"}
		this.ServeJSON()
	} else {
		result = Comment.CommentList(startIndex, maxCounts, "-Created", id, 2)
		this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "", "data": result}
		this.ServeJSON()
	}
}
