package inital

import (
	"Qa/dbconf"
	"fmt"
	"github.com/astaxie/beego"
	"github.com/astaxie/beego/orm"
	_ "github.com/go-sql-driver/mysql"
)

func initSql() {
	runMode := beego.AppConfig.String("runmode")
	mysqlConf := dbconf.GetMysqlConfig()
	alldbconf := mysqlConf[runMode]
	orm.RegisterDriver("mysql", orm.DRMySQL)
	for v := range alldbconf {
		user := alldbconf[v]["user"]
		password := alldbconf[v]["password"]
		host := alldbconf[v]["host"]
		port := alldbconf[v]["port"]
		dbname := alldbconf[v]["dbname"]
		orm.RegisterDataBase("default", "mysql", fmt.Sprintf("%s:%s@tcp(%s:%d)/%s?charset=utf8", user, password, host, port, dbname))
	}
}
