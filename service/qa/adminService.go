package qa

import (
	"Qa/library/rand"
	"Qa/library/scrypt"
	"Qa/models/user"
	"Qa/service/redisService"
	"Qa/validator"
	"fmt"
	"github.com/astaxie/beego/validation"
	"regexp"
)

const default_password = "pass@123456"

type CreatUser struct {
	Did      int64
	Job      string
	Name     string
	UserName string
	Level    int
	Role     int64
	Manager  int
	Sex      int
	Age      int
	Head     int64
}

type EditUser struct {
	Did     int64
	Job     string
	Level   int
	Role    int64
	Manager int
	Sex     int
	Age     int
	Uid     int64
	Head    int64
}

type UpdatePassword struct {
	Uid             int64
	Password        string
	ConfirmPassword string
}

type AdminService struct {
}

type Alldes struct {
	Did      int64     `json:"id"`
	Dname    string    `json:"name"`
	Open     bool      `json:"open"`
	Children []*Alldes `json:"children"`
}

func (this *AdminService) GetAllDeparment(pid int64, des *Alldes) {
	var deparment user.Deparment
	items := deparment.GetDeparment(pid)
	fmt.Println(des)
	if len(items) > 0 {
		for _, item := range items {
			Did, _ := item["Id"].(int64)
			Dname, _ := item["Pname"].(string)
			Open := true
			children := Alldes{
				Did,
				Dname,
				Open,
				[]*Alldes{}}
			this.GetAllDeparment(Did, &children)
			if children.Did != 0 {
				des.Children = append(des.Children, &children)
			}
		}
	}
}

func (this *AdminService) AddUser(additem CreatUser) SaveResult {
	var result SaveResult
	valid := validation.Validation{}
	val := validator.UserAddValidation{
		Did:      additem.Did,
		Job:      additem.Job,
		Name:     additem.Name,
		UserName: additem.UserName,
		Level:    additem.Level,
		Role:     additem.Role,
		Manager:  additem.Manager,
		Sex:      additem.Sex,
		Age:      additem.Age,
	}
	is, err := valid.Valid(&val)
	if err != nil {
		result.ErrMsg = "传入正确的参数"
		result.IsSuccess = false
	} else if !is {
		for _, err := range valid.Errors {
			result.ErrMsg = fmt.Sprintf("%s:%s", err.Key, err.Message)
		}
		result.IsSuccess = false
	} else {
		var getUser user.User
		var validName = regexp.MustCompile(`[\w]+`)
		var validUserName = regexp.MustCompile(`^[\p{Han}]+$`)
		errName := validName.MatchString(additem.Name)
		errUserName := validUserName.MatchString(additem.UserName)
		fmt.Println(errName, errUserName)
		if !errName {
			result.ErrMsg = "用户名只能是英文!"
			result.IsSuccess = false
			return result
		}
		if !errUserName {
			result.ErrMsg = "用户真实名只能是中文!"
			result.IsSuccess = false
			return result
		}
		_, errget := getUser.GetUserByName(additem.Name)
		total, _ := getUser.GetUserByUserName(additem.UserName)
		if total != 0 {
			additem.UserName = fmt.Sprintf("%s%d", additem.UserName, total)
		}
		if errget != nil {
			uid, err := addUserTodb(additem)
			fmt.Println(uid, err)
			if err != nil {
				result.ErrMsg = "系统错误"
				result.IsSuccess = false
			} else {
				addEmployeeTodb(additem, uid)
				err := saveUserInfo(additem, uid)
				if err != nil {
					result.ErrMsg = "系统错误"
					result.IsSuccess = false
				} else {
					result.ErrMsg = "保存成功"
					result.IsSuccess = true
				}
			}
		} else {
			result.ErrMsg = "用户名已经存在！"
			result.IsSuccess = false
		}
	}
	return result
}

func addUserTodb(additem CreatUser) (int64, error) {
	var addUser user.User
	var add user.User
	var randstring rand.RandString
	var scrypt scrypt.Scrypt
	addUser.Name = additem.Name
	addUser.Head = additem.Head
	addUser.UserName = additem.UserName
	addUser.Email = fmt.Sprintf("%s@qa.cn", additem.Name)
	addUser.Salt = randstring.RandStringByNowTime(6)
	addUser.Password = scrypt.StringHash(default_password, addUser.Salt, 32)
	addUser.Age = additem.Age
	addUser.Sex = additem.Sex
	addUser.Avatar = "http://localhost:8087/static/img/user/default.jpg"
	id, err := add.AddUser(addUser)
	return id, err
}

func addEmployeeTodb(additem CreatUser, Uid int64) (int64, error) {
	var AddEmployee user.Employee
	var add user.Employee
	AddEmployee.Uid = Uid
	AddEmployee.DeId = additem.Did
	AddEmployee.Manager = additem.Manager
	AddEmployee.Role = additem.Role
	AddEmployee.Job = additem.Job
	AddEmployee.Level = additem.Level
	id, err := add.AddEmployee(AddEmployee)
	return id, err
}

func saveUserInfo(additem CreatUser, uid int64) error {
	var userRedis redisService.UserRedisService
	var userinfo redisService.UserInfo
	userinfo.Uid = uid
	userinfo.Name = additem.Name
	userinfo.UserName = additem.UserName
	userinfo.Email = fmt.Sprintf("%s@qa.cn", additem.Name)
	userinfo.Age = additem.Age
	userinfo.Sex = additem.Sex
	userinfo.Avatar = "http://localhost:8087/static/img/user/default.jpg"
	userinfo.Manager = additem.Manager
	userinfo.Job = additem.Job
	userinfo.Level = additem.Level
	userinfo.Role = additem.Role
	userinfo.Did = additem.Did
	err := userRedis.SetUserInfo(uid, userinfo)
	return err
}

func (this *AdminService) GetEditUser(uid int64) (CreatUser, error) {
	var GetEmployee user.Employee
	var GetUser user.User
	var editUser CreatUser
	userInfo, err := GetUser.GetUserByUid(uid)
	empolyeeInfo, errorGetEm := GetEmployee.GetEmployeeByUid(uid)
	fmt.Println(userInfo, empolyeeInfo)
	if err != nil || errorGetEm != nil {
		return editUser, err
	} else {
		editUser.Did = empolyeeInfo.DeId
		editUser.Job = empolyeeInfo.Job
		editUser.Name = userInfo.Name
		editUser.UserName = userInfo.UserName
		editUser.Level = empolyeeInfo.Level
		editUser.Role = empolyeeInfo.Role
		editUser.Manager = empolyeeInfo.Manager
		editUser.Sex = userInfo.Sex
		editUser.Age = userInfo.Age
		editUser.Head = userInfo.Head
	}
	return editUser, nil
}

func (this *AdminService) EditUser(edititem EditUser) SaveResult {
	var result SaveResult
	valid := validation.Validation{}
	val := validator.UserEditValidation{
		Did:     edititem.Did,
		Job:     edititem.Job,
		Level:   edititem.Level,
		Role:    edititem.Role,
		Manager: edititem.Manager,
		Sex:     edititem.Sex,
		Age:     edititem.Age,
		Uid:     edititem.Uid,
	}
	is, err := valid.Valid(&val)
	if err != nil {
		result.ErrMsg = "传入正确的参数"
		result.IsSuccess = false
	} else if !is {
		for _, err := range valid.Errors {
			result.ErrMsg = fmt.Sprintf("%s:%s", err.Key, err.Message)
		}
		result.IsSuccess = false
	} else {
		var getUser user.User
		fmt.Println(edititem)
		_, errUid := getUser.GetUserByUid(edititem.Uid)
		if errUid != nil {
			result.ErrMsg = "不存在该用户"
			result.IsSuccess = false
		} else {
			updateUserError := EditUserTodb(edititem)
			updateEmployeeError := EditEmployeeTodb(edititem)
			updateUserInfoError := saveEditUserInfo(edititem)
			fmt.Println(updateEmployeeError, updateUserError, updateUserInfoError)
			if updateUserError != nil || updateEmployeeError != nil || updateUserInfoError != nil {
				result.ErrMsg = "系统错误"
				result.IsSuccess = false
			} else {
				result.ErrMsg = "保存成功"
				result.IsSuccess = true
			}
		}
	}
	return result
}

func EditUserTodb(edititem EditUser) error {
	var editUser user.User
	var edit user.User
	editUser.Age = edititem.Age
	editUser.Sex = edititem.Sex
	editUser.Head = edititem.Head
	err := edit.EditUser(edititem.Uid, editUser)
	fmt.Println(edititem.Head)
	return err
}

func EditEmployeeTodb(edititem EditUser) error {
	var editEmployee user.Employee
	var edit user.Employee
	editEmployee.DeId = edititem.Did
	editEmployee.Job = edititem.Job
	editEmployee.Level = edititem.Level
	editEmployee.Manager = edititem.Manager
	editEmployee.Role = edititem.Role
	err := edit.EditEmployee(edititem.Uid, editEmployee)
	return err
}

func saveEditUserInfo(edititem EditUser) error {
	var userRedis redisService.UserRedisService
	UserInfo := userRedis.GetUserInfo(edititem.Uid)
	UserInfo.Age = edititem.Age
	UserInfo.Sex = edititem.Sex
	UserInfo.Manager = edititem.Manager
	UserInfo.Job = edititem.Job
	UserInfo.Level = edititem.Level
	UserInfo.Role = edititem.Role
	UserInfo.Did = edititem.Did
	UserInfo.Head = edititem.Head
	err := userRedis.SetUserInfo(edititem.Uid, UserInfo)
	return err
}

func (this *AdminService) UpdatePassword(edititem UpdatePassword) SaveResult {
	var result SaveResult
	valid := validation.Validation{}
	val := validator.UserUpdatePasswordValidation{
		Uid:             edititem.Uid,
		Password:        edititem.Password,
		ConfirmPassword: edititem.ConfirmPassword,
	}
	is, err := valid.Valid(&val)
	if err != nil {
		result.ErrMsg = "传入正确的参数"
		result.IsSuccess = false
	} else if !is {
		for _, err := range valid.Errors {
			result.ErrMsg = fmt.Sprintf("%s:%s", err.Key, err.Message)
		}
		result.IsSuccess = false
	} else {

		if edititem.Password != edititem.ConfirmPassword {
			result.ErrMsg = "前后输入密码不一致"
			result.IsSuccess = false
			return result
		}
		if len(edititem.Password) < 6 || len(edititem.Password) > 20 {
			result.ErrMsg = "密码长度在6-20之间"
			result.IsSuccess = false
			return result
		}
		var isNumber = false
		var isString = false
		ValidNumber := regexp.MustCompile(`^\d*$`)
		ValidString := regexp.MustCompile(`^[A-Za-z]+$`)
		ValidPassword := regexp.MustCompile(`^[A-Za-z0-9]{6,20}$`)
		isNumber = ValidNumber.MatchString(edititem.Password)
		isString = ValidString.MatchString(edititem.Password)
		isValid := ValidPassword.MatchString(edititem.Password)
		resultValid1 := isNumber || isString
		if resultValid1 == true {
			result.ErrMsg = "密码必须包含数字和字母"
			result.IsSuccess = false
			return result
		}
		if !isValid {
			result.ErrMsg = "密码必须包含数字和字母"
			result.IsSuccess = false
			return result
		}
		var getUser user.User
		_, errUid := getUser.GetUserByUid(edititem.Uid)
		if errUid != nil {
			result.ErrMsg = "不存在该用户"
			result.IsSuccess = false
			return result
		} else {
			var scrypt scrypt.Scrypt
			var randstring rand.RandString
			salt := randstring.RandStringByNowTime(6)
			password := scrypt.StringHash(edititem.Password, salt, 32)
			errUpdatePassWord := getUser.EditUserPassword(edititem.Uid, salt, password)
			if errUpdatePassWord != nil {
				result.ErrMsg = "系统错误"
				result.IsSuccess = false
			} else {
				result.ErrMsg = "保存成功"
				result.IsSuccess = true
			}
		}
	}
	return result
}
