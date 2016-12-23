package routers

import (
	"Qa/controllers"
	"Qa/controllers/article"
	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	//文章
	beego.Router("/article", &article.Article{}, "*:Index")
	beego.Router("/article/add", &article.Article{}, "*:Add")
	beego.Router("/article/edit/:aid:int", &article.Article{}, "*:Edit")
	beego.Router("/article/detail/:aid:int", &article.Article{}, "*:Detail")
	beego.Router("/article/my", &article.Article{}, "*:My")
	beego.Router("/article/my/recycle", &article.Article{}, "*:Recycle")
}
