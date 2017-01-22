package qa

import (
	"Qa/library/rand"
	"Qa/library/scrypt"
	"Qa/models/user"
	"Qa/service/redisService"
	"Qa/validator"
	"fmt"
	"github.com/astaxie/beego/validation"
)

const default_password = "pass@123456"

type CreatUser struct {
	Did     int64
	Job     string
	Name    string
	Level   int
	Role    string
	Manager int
	Sex     int
	Age     int
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
		Did:     additem.Did,
		Job:     additem.Job,
		Name:    additem.Name,
		Level:   additem.Level,
		Role:    additem.Role,
		Manager: additem.Manager,
		Sex:     additem.Sex,
		Age:     additem.Age,
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
		_, errget := getUser.GetUserByName(additem.Name)
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
	userinfo.Email = fmt.Sprintf("%s@qa.cn", additem.Name)
	userinfo.Age = additem.Age
	userinfo.Sex = additem.Sex
	userinfo.Avatar = "http://localhost:8087/static/img/user/default.jpg"
	userinfo.Manager = additem.Manager
	userinfo.Job = additem.Job
	userinfo.Level = additem.Level
	userinfo.Role = additem.Role
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
		editUser.Level = empolyeeInfo.Level
		editUser.Role = empolyeeInfo.Role
		editUser.Manager = empolyeeInfo.Manager
		editUser.Sex = userInfo.Sex
		editUser.Age = userInfo.Age
	}
	return editUser, nil
}
