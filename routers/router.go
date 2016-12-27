package routers

import (
	"Qa/controllers"
	"Qa/controllers/api"
	"Qa/controllers/article"
	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	//文章
	beego.AutoRouter(&article.Article{})

	//api接口路由
	ns := beego.NewNamespace("/api",
		beego.NSNamespace("/article",
			beego.NSInclude(
				&api.Article{},
			),
		),
	)
	beego.AddNamespace(ns)
}
