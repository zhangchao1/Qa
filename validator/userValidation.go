package validator

type UserAddValidation struct {
	Did     int64  `valid:"Required"`
	Job     string `valid:"Required; MaxSize(50)"`
	Name    string `valid:"Required"`
	Level   int    `valid:"Required"`
	Role    string `valid:"Required"`
	Manager int    `valid:"Required"`
	Sex     int    `valid:"Required"`
	Age     int    `valid:"Required"`
}

type UserEditValidation struct {
	Did     int64  `valid:"Required"`
	Job     string `valid:"Required; MaxSize(50)"`
	Level   int    `valid:"Required"`
	Role    string `valid:"Required"`
	Manager int    `valid:"Required"`
	Sex     int    `valid:"Required"`
	Age     int    `valid:"Required"`
	Uid     int64  `valid:"Required"`
}
