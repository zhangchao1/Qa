package qa

import (
	"Qa/models/user"
	"fmt"
)

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
