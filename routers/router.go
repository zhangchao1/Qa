package routers

import (
	"Qa/controllers"
	"Qa/controllers/api"
	"Qa/controllers/article"
	"Qa/controllers/attendance"
	"Qa/controllers/colorlife"
	"Qa/controllers/goods"
	"Qa/controllers/leave"
	"Qa/controllers/overtime"
	"Qa/controllers/project"
	"Qa/controllers/reimbursement"
	"Qa/controllers/resume"
	"Qa/controllers/travel"
	"Qa/controllers/user"
	"github.com/astaxie/beego"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	//文章
	beego.AutoRouter(&article.Article{})
	beego.AutoRouter(&attendance.Attendance{})
	beego.AutoRouter(&overtime.Overtime{})
	beego.AutoRouter(&project.Project{})
	beego.AutoRouter(&reimbursement.Reimbursement{})
	beego.AutoRouter(&resume.Resume{})
	beego.AutoRouter(&travel.Travel{})
	beego.AutoRouter(&user.User{})
	beego.AutoRouter(&leave.Leave{})
	beego.AutoRouter(&colorlife.Colorlife{})
	beego.AutoRouter(&goods.Goods{})
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
