package routers

import (
	"Qa/controllers"
	"Qa/controllers/api"
	"Qa/controllers/article"
	"Qa/controllers/attendance"
	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	//文章
	beego.AutoRouter(&article.Article{})
	beego.AutoRouter(&attendance.Attendance{})
	//api接口路由
	ns := beego.NewNamespace("/api",
		beego.NSNamespace("/article",
			beego.NSInclude(
				&api.Article{},
			),
		),
		beego.NSNamespace("/attendance",
			beego.NSInclude(
				&api.Attendance{},
			),
		),
	)
	beego.AddNamespace(ns)
}
