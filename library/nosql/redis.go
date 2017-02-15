package nosql

import (
	"Qa/dbconf"
	"errors"
	"fmt"
	"github.com/astaxie/beego"
	"gopkg.in/redis.v4"
)

func ConnetRedis(dbName string) (r *redis.Client, err error) {
	runMode := beego.AppConfig.String("runmode")
	redisConf := dbconf.GetRedisConf()
	allRedisConf := redisConf[runMode]
	connectInfo := allRedisConf[dbName]
	host := connectInfo["host"]
	port := connectInfo["port"]
	db := connectInfo["db"]
	password := connectInfo["password"]
	addr := fmt.Sprintf("%s:%s", host, port)
	client := redis.NewClient(&redis.Options{
		Addr:     addr,
		Password: password.(string),
		DB:       db.(int),
	})
	pong, err := client.Ping().Result()
	if err != nil {
		return nil, err
	}
	if pong == "pong" {
		return client, nil
	}
	return client, errors.New(pong) //return pong result as errors type
}
