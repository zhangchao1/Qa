package validator

type ColorlifeSaveValidation struct {
	Uid         int64  `valid:"Required"`
	Title       string `valid:"Required; MaxSize(50)"`
	Description string `valid:"Required; MaxSize(50)"`
	Tag         string `valid:"Required; MaxSize(50)"`
	Ablums      string `valid:"Required"`
	IsPublic    int    `valid:"Required"`
}

type ColorlifeEditValidation struct {
	Id          int64  `valid:"Required"`
	Title       string `valid:"Required; MaxSize(50)"`
	Description string `valid:"Required; MaxSize(50)"`
	Tag         string `valid:"Required; MaxSize(50)"`
	Ablums      string `valid:"Required"`
	IsPublic    int    `valid:"Required"`
}
