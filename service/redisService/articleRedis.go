package redisService

import (
	"Qa/library/nosql"
	"Qa/models/article"
	"encoding/json"
	"fmt"
	"gopkg.in/redis.v4"
	"strconv"
)

const ARTICLE_INFO = "qa:article:info:%d"

var articleRedis *redis.Client

type ArticleRedis struct {
}

func init() {
	articleRedis, _ = nosql.ConnetRedis("article")
}

func (this *ArticleRedis) AddArticleInfo(aid int64, articleInfo article.Article) bool {
	Aid := strconv.Itoa(aid)
	cancheKey := fmt.Sprintf(ARTICLE_INFO, Aid)
	info := json.Marshal(articleInfo)
	err := articleRedis.Set(cancheKey, info).Err()
	if err != nil {
		return false
	} else {
		return true
	}
}

func (this *ArticleRedis) GetArticleInfo(aid int64) article.Article {
	Aid := strconv.Itoa(aid)
	cancheKey := fmt.Sprintf(ARTICLE_INFO, Aid)
	info, err := articleRedis.Get(cancheKey).Result()
	if err != nil {
		return article.Article{}
	} else {
		var articleInfo article.Article
		err := json.Unmarshal([]byte(info), &articleInfo)
		fmt.Println(err)
		return articleInfo
	}
}
