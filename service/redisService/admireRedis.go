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

func (this *AdmireRedisService) init() {
	AdmireRedis, _ = nosql.ConnetRedis("admire")
}

func (this *AdmireRedisService) AddAdmiresArticle(guid int, count int) *redis.BoolCmd {
	AdmrieKey := fmt.Sprintf(ADMIRE_KEY_ARTICLE, guid)
	Guid := strconv.Itoa(guid)
	Count := strconv.Itoa(count)
	Success := AdmireRedis.HSet(AdmrieKey, Guid, Count)
	return Success
}

func (this *AdmireRedisService) AdmireStatusArticle(guid int, uid int) *redis.BoolCmd {
	UadmireKey := fmt.Sprintf(U_ADMIRE_ARTICLE_KEY, guid)
	fmt.Println(UadmireKey)
	Uid := strconv.Itoa(uid)
	Status := AdmireRedis.SIsMember(UadmireKey, Uid)
	fmt.Println(Status)
	return Status
}
