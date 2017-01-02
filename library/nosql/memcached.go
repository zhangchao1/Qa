package nosql

import (
	"Qa/dbconf"
	"fmt"
	"github.com/astaxie/beego"
	"github.com/bradfitz/gomemcache/memcache"
)

func ConnetMemcached(connetionName string) (c *memcache.Client) {
	var url string
	runMode := beego.AppConfig.String("runmode")
	memcachedConf := dbconf.GetMemcachedConf()
	allmemcachedConf := memcachedConf[runMode]
	host := allmemcachedConf[connetionName]["host"]
	port := allmemcachedConf[connetionName]["port"]
	url = fmt.Sprintf("%s:%d", host, port)
	mc := memcache.New(url)
	return mc
}
