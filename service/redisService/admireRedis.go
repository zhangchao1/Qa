package redisService

import (
	"Qa/library/nosql"
	"fmt"
	"gopkg.in/redis.v4"
	"strconv"
)

const ADMIRE_KEY_ARTICLE = "qa:admire:article:%d"
const U_ADMIRE_ARTICLE_KEY = "qa:u:admire:article:%d"

var AdmireRedis *redis.Client

type AdmireRedisService struct {
}

func init() {
	AdmireRedis, _ = nosql.ConnetRedis("admire")
	fmt.Print(AdmireRedis)
}

func (this *AdmireRedisService) AddAdmiresArticle(guid int, count int) bool {
	AdmrieKey := fmt.Sprintf(ADMIRE_KEY_ARTICLE, guid)
	Guid := strconv.Itoa(guid)
	Count := strconv.Itoa(count)
	err := AdmireRedis.HSet(AdmrieKey, Guid, Count).Err()
	if err != nil {
		return false
	} else {
		return true
	}
}

func (this *AdmireRedisService) AdmireStatusArticle(guid int, uid int) bool {
	UadmireKey := fmt.Sprintf(U_ADMIRE_ARTICLE_KEY, guid)
	fmt.Println(UadmireKey)
	Uid := strconv.Itoa(uid)
	err := AdmireRedis.SIsMember(UadmireKey, Uid).Err()
	if err != nil {
		return false
	} else {
		return true
	}
}

func (this *AdmireRedisService) AddArtileAdmires(guid int, uid int) bool {
	UadmireKey := fmt.Sprintf(U_ADMIRE_ARTICLE_KEY, guid)
	fmt.Println(UadmireKey)
	Uid := strconv.Itoa(uid)
	err := AdmireRedis.SAdd(UadmireKey, Uid).Err()
	if err != nil {
		return false
	} else {
		return true
	}
}
