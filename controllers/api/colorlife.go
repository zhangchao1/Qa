package api

import (
	"crypto/md5"
	"encoding/hex"
	"time"
)

type ColorLife struct {
	ControllerBase
}

// @router /upload [post]
func (this *ColorLife) Upload() {
	f, _, err := this.GetFile("upload_logo")
	defer f.Close()
	if err != nil {
		this.Data["json"] = map[string]interface{}{"IsSuccess": false, "ErrMsg": "系统错误"}
		this.ServeJSON()
	} else {
		nowTime := time.Now().Format("2006-01-02 15:04:05")
		md5Ctx := md5.New()
		md5Ctx.Write([]byte(nowTime))
		cipherStr := md5Ctx.Sum(nil)
		filename := hex.EncodeToString(cipherStr) + ".jpg"
		this.SaveToFile("upload_logo", "static/img/colorlife/"+filename)
		uolpad_url := "http://localhost:8087/static/img/colorlife/" + filename
		this.Data["json"] = map[string]interface{}{"IsSuccess": true, "ErrMsg": "上传成功", "imgurl": uolpad_url}
		this.ServeJSON()
	}
}
