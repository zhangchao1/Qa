package main

import (
	_ "Qa/inital"
	_ "Qa/routers"
	"github.com/astaxie/beego"
)

func main() {
	beego.Run()

}
