package validator

type UserAddValidation struct {
	Did      int64  `valid:"Required"`
	Job      string `valid:"Required;MaxSize(50)"`
	Name     string `valid:"Required"`
	UserName string `valid:"Required"`
	Level    int    `valid:"Required"`
	Role     int64  `valid:"Required"`
	Manager  int    `valid:"Required"`
	Sex      int    `valid:"Required"`
	Age      int    `valid:"Required"`
}

type UserEditValidation struct {
	Did     int64  `valid:"Required"`
	Job     string `valid:"Required; MaxSize(50)"`
	Level   int    `valid:"Required"`
	Role    int64  `valid:"Required"`
	Manager int    `valid:"Required"`
	Sex     int    `valid:"Required"`
	Age     int    `valid:"Required"`
	Uid     int64  `valid:"Required"`
}

type UserUpdatePasswordValidation struct {
	Uid             int64  `valid:"Required"`
	Password        string `valid:"Required"`
	ConfirmPassword string `valid:"Required"`
}

type UserDetailEditValidation struct {
	Habit    string `valid:"Required"`
	Motto    string `valid:"Required"`
	Eduction string `valid:"Required"`
	Location string `valid:"Required"`
	PhoneNum string `valid:"Required; Mobile"`
	Birthday string `valid:"Required"`
}
