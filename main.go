package main

import (
	_ "Qa/inital"
	_ "Qa/routers"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/session"
)

func main() {
	sessionconf := &session.ManagerConfig{}
	beego.BConfig.WebConfig.Session.SessionOn = true
	beego.BConfig.WebConfig.Session.SessionGCMaxLifetime = 3600
	beego.BConfig.WebConfig.Session.SessionCookieLifeTime = 3600
	beego.BConfig.WebConfig.Session.SessionName = "qaseesion"
	beego.BConfig.WebConfig.Session.SessionProvider = "file"
	beego.BConfig.WebConfig.Session.SessionProviderConfig = "/session"
	beego.GlobalSessions, _ = session.NewManager("file", sessionconf)

	go beego.GlobalSessions.GC()
	beego.Run()
}
