package qa

import (
	"Qa/models/admire"
	"fmt"
)

type Result struct {
	IsSuccess bool
	ErrMsg    string
	Count     int
}

type AdmireService struct {
}

func (this *AdmireService) AddAdmire(guid int64, types int64, count int64, name string, uid int64) bool {
	var addAdmire admire.Admire
	var addUserAdmire admire.UserAdmire
	addItem := admire.Admire{Guid: guid, Types: types, Count: count}
	addUserItem := admire.UserAdmire{Uid: uid, Guid: guid, Types: types, Name: name}
	var errAdmireStatus error
	_, err := addAdmire.GetAdmireByGuidAndTypes(guid, types)
	if err != nil {
		_, errAdmireStatus = addAdmire.AddAdmire(addItem)
	} else {
		errAdmireStatus = addAdmire.UpdateAdmire(guid, types)
	}
	_, errUserAdmireStatus := addUserAdmire.AddUserAdmire(addUserItem)
	fmt.Println(errUserAdmireStatus, errAdmireStatus)
	if errUserAdmireStatus == nil && errAdmireStatus == nil {
		return true
	} else {
		return false
	}
}
