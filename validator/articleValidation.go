package validator

type ArticleSaveValidation struct {
	Uid         int64  `valid:"Required"`
	Title       string `valid:"Required"`
	Content     string `valid:"Required"`
	Description string `valid:"Required"`
	Tag         string `valid:"Required"`
	Types       string `valid:"Required"`
}

type ArticleEditValidation struct {
	Id          int64  `valid:"Required"`
	Title       string `valid:"Required"`
	Content     string `valid:"Required"`
	Description string `valid:"Required"`
	Tag         string `valid:"Required"`
	Types       string `valid:"Required"`
}
