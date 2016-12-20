package nosql

import (
	"Qa/dbconf"
	"fmt"
	"github.com/astaxie/beego"
	"github.com/bradfitz/gomemcache/memcache"
)

func ConnetMemcached(ConnetionName string) (c *memcache.Client) {
	var url string
	runMode := beego.AppConfig.String("runmode")
	memcachedConf := dbconf.GetMemcachedConf()
	allmemcachedConf := memcachedConf[runMode]
	host := allmemcachedConf[ConnetionName]["host"]
	port := allmemcachedConf[ConnetionName]["port"]
	url = fmt.Sprintf("%s:%d", host, port)
	mc := memcache.New(url)
	return mc
}
