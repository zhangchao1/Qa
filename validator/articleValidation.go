package validator

type ArticleSaveValidation struct {
	Uid         int64  `valid:"Required"`
	Title       string `valid:"Required; MaxSize(50)"`
	Content     string `valid:"Required"`
	Description string `valid:"Required; MaxSize(100)"`
	Tag         string `valid:"Required; MaxSize(20)"`
	Types       string `valid:"Required; MaxSize(20)"`
}

type ArticleEditValidation struct {
	Id          int64  `valid:"Required"`
	Title       string `valid:"Required; MaxSize(50)"`
	Content     string `valid:"Required"`
	Description string `valid:"Required; MaxSize(100)"`
	Tag         string `valid:"Required; MaxSize(20)"`
	Types       string `valid:"Required; MaxSize(20)"`
}
