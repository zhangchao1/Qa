package redisService

import (
	"Qa/library/nosql"
	"fmt"
	"gopkg.in/redis.v4"
	"strconv"
)

const ADMIRE_KEY_ARTICLE = "qa:admire:article:%d"
const U_ADMIRE_ARTICLE_KEY = "qa:u:admire:article:%d"
const ADMIRE_KEY_COLORLIFE = "qa:admire:colorlife:%d"
const U_ADMIRE_COLORLIFE_KEY = "qa:u:admire:colorlife:%d"

var AdmireRedis *redis.Client

type AdmireRedisService struct {
}

func init() {
	AdmireRedis, _ = nosql.ConnetRedis("admire")
	fmt.Print(AdmireRedis)
}

func (this *AdmireRedisService) AddAdmiresArticle(guid int) int64 {
	AdmrieKey := fmt.Sprintf(ADMIRE_KEY_ARTICLE, guid)
	Guid := strconv.Itoa(guid)
	count, _ := AdmireRedis.HIncrBy(AdmrieKey, Guid, 1).Result()
	return count
}

func (this *AdmireRedisService) AdmireStatusArticle(guid int, uid int) bool {
	UadmireKey := fmt.Sprintf(U_ADMIRE_ARTICLE_KEY, guid)
	Uid := strconv.Itoa(uid)
	status, _ := AdmireRedis.SIsMember(UadmireKey, Uid).Result()
	if status == false {
		return false
	} else {
		return true
	}
}

func (this *AdmireRedisService) AddUserAdmires(guid int, uid int) int64 {
	UadmireKey := fmt.Sprintf(U_ADMIRE_ARTICLE_KEY, guid)
	fmt.Println(UadmireKey)
	Uid := strconv.Itoa(uid)
	status, _ := AdmireRedis.SAdd(UadmireKey, Uid).Result()
	return status
}

func (this *AdmireRedisService) RemoveUserAdmires(guid int, uid int) int64 {
	UadmireKey := fmt.Sprintf(U_ADMIRE_ARTICLE_KEY, guid)
	fmt.Println(UadmireKey)
	Uid := strconv.Itoa(uid)
	status, _ := AdmireRedis.SRem(UadmireKey, Uid).Result()
	return status
}

func (this *AdmireRedisService) AddAdmiresColorlife(guid int) int64 {
	AdmrieKey := fmt.Sprintf(ADMIRE_KEY_COLORLIFE, guid)
	Guid := strconv.Itoa(guid)
	count, _ := AdmireRedis.HIncrBy(AdmrieKey, Guid, 1).Result()
	return count
}

func (this *AdmireRedisService) AdmireStatusColorlife(guid int, uid int) bool {
	UadmireKey := fmt.Sprintf(U_ADMIRE_COLORLIFE_KEY, guid)
	Uid := strconv.Itoa(uid)
	status, _ := AdmireRedis.SIsMember(UadmireKey, Uid).Result()
	if status == false {
		return false
	} else {
		return true
	}
}

func (this *AdmireRedisService) AddUserColorlifeAdmires(guid int, uid int) int64 {
	UadmireKey := fmt.Sprintf(U_ADMIRE_COLORLIFE_KEY, guid)
	fmt.Println(UadmireKey)
	Uid := strconv.Itoa(uid)
	status, _ := AdmireRedis.SAdd(UadmireKey, Uid).Result()
	return status
}

func (this *AdmireRedisService) RemoveUserColorlifeAdmires(guid int, uid int) int64 {
	UadmireKey := fmt.Sprintf(U_ADMIRE_COLORLIFE_KEY, guid)
	fmt.Println(UadmireKey)
	Uid := strconv.Itoa(uid)
	status, _ := AdmireRedis.SRem(UadmireKey, Uid).Result()
	return status
}
