package main

import (
	_ "Qa/inital"
	"Qa/models/article"
	_ "Qa/routers"
	"fmt"
	"github.com/astaxie/beego"
)

func main() {
	var updateac article.Article
	updateac, err := article.GetArticleById(1)
	fmt.Println(err, updateac)
	beego.Run()
}
