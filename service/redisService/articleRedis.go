package redisService

import (
	"Qa/library/nosql"
	"Qa/models/article"
	"encoding/json"
	"fmt"
	"gopkg.in/redis.v4"
)

const ARTICLE_INFO = "qa:article:info:%d"

var articleRedis *redis.Client

type ArticleRedis struct {
}

func init() {
	articleRedis, _ = nosql.ConnetRedis("article")
}

func (this *ArticleRedis) AddArticleInfo(aid int64, articleInfo article.Article) error {
	cancheKey := fmt.Sprintf(ARTICLE_INFO, aid)
	info, _ := json.Marshal(articleInfo)
	_, status := articleRedis.Set(cancheKey, info, 0).Result()
	return status
}

func (this *ArticleRedis) GetArticleInfo(aid int64) article.Article {
	cancheKey := fmt.Sprintf(ARTICLE_INFO, aid)
	fmt.Println(cancheKey)
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
