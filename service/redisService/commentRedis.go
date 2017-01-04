package redisService

import (
	"Qa/library/nosql"
	"fmt"
	"gopkg.in/redis.v4"
	"strconv"
)

const COMMENT_KEY_ARTICLE = "qa:comment:article:%d"

var CommentRedis *redis.Client

type CommentRedisService struct {
}

func init() {
	CommentRedis, _ = nosql.ConnetRedis("comment")
	fmt.Print(CommentRedis)
}

func (this *CommentRedisService) AddCommentArticle(cid int) int64 {
	CommentKey := fmt.Sprintf(COMMENT_KEY_ARTICLE, cid)
	Cid := strconv.Itoa(cid)
	count, _ := AdmireRedis.HIncrBy(CommentKey, Cid, 1).Result()
	return count
}
