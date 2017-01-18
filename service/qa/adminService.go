package qa

import (
	"Qa/models/user"
	"fmt"
)

type AdminService struct {
}

type Alldes struct {
	Did      int64
	Dname    string
	Pid      int64
	Level    int64
	Children []*Alldes
}

func (this *AdminService) GetAllDeparment(pid int64, des *Alldes) {
	var deparment user.Deparment
	items := deparment.GetDeparment(pid)
	fmt.Println(des)
	if len(items) > 0 {
		for _, item := range items {
			Did, _ := item["Id"].(int64)
			Dname, _ := item["Pname"].(string)
			Pid, _ := item["Pid"].(int64)
			Level, _ := item["Level"].(int64)
			children := Alldes{
				Did,
				Dname,
				Pid,
				Level,
				[]*Alldes{}}
			this.GetAllDeparment(Did, &children)
			if children.Did != 0 {
				des.Children = append(des.Children, &children)
			}
		}
	}
}
