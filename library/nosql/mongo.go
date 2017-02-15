package nosql

import (
	"Qa/dbconf"
	"fmt"
	"github.com/astaxie/beego"
	"gopkg.in/mgo.v2"
)

func ConnetMongo(connectName string) (s *mgo.Session, err error) {
	runMode := beego.AppConfig.String("runmode")
	mongoConf := dbconf.GetMongoConf()
	allmongoConf := mongoConf[runMode]
	connectInfo := allmongoConf[connectName]
	host := connectInfo["host"]
	port := connectInfo["port"]
	db := connectInfo["dbname"]
	var connectUrl string
	connectUrl = fmt.Sprintf("%s:%d/%s", host, port, db)
	session, err := mgo.Dial(connectUrl)
	if err != nil {
		return nil, err
	}
	return session.Clone(), nil
}
